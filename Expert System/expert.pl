% Plant Disease Diagnosis Expert System

:- dynamic symptom/2.
:- dynamic diagnosis/2.

% Plants
plant(tomato).
plant(potato).
plant(rose).

% Initial symptoms
symptom(tomato, yellow_leaves).
symptom(tomato, brown_spots).
symptom(tomato, wilting).

symptom(potato, dark_spots).
symptom(potato, leaf_wilting).

symptom(rose, white_patches).
symptom(rose, leaf_curling).

% Disease diagnosis rules

diagnose(Plant, leaf_blight) :-
    symptom(Plant, yellow_leaves),
    symptom(Plant, brown_spots),
    symptom(Plant, wilting).

diagnose(Plant, early_blight) :-
    symptom(Plant, dark_spots),
    symptom(Plant, leaf_wilting).

diagnose(Plant, powdery_mildew) :-
    symptom(Plant, white_patches),
    symptom(Plant, leaf_curling).

% Treatment recommendations

treatment(leaf_blight, 'Remove infected leaves and avoid excessive watering.').

treatment(early_blight, 'Remove affected leaves and improve air circulation.').

treatment(powdery_mildew, 'Remove infected parts and apply a suitable fungicide.').

% Perform diagnosis

perform_diagnosis(Plant) :-
    diagnose(Plant, Disease),
    treatment(Disease, Treatment),
    retractall(diagnosis(Plant, _)),
    assertz(diagnosis(Plant, Disease)),
    format('Plant: ~w~n', [Plant]),
    format('Disease: ~w~n', [Disease]),
    format('Recommendation: ~w~n~n', [Treatment]).

perform_diagnosis(Plant) :-
    plant(Plant),
    \+ diagnose(Plant, _),
    format('Plant: ~w~n', [Plant]),
    format('No matching disease found.~n~n', []).

% Add a symptom

add_symptom(Plant, Symptom) :-
    assertz(symptom(Plant, Symptom)),
    format('Added ~w symptom to ~w.~n', [Symptom, Plant]).

% Remove a symptom

remove_symptom(Plant, Symptom) :-
    retract(symptom(Plant, Symptom)),
    format('Removed ~w symptom from ~w.~n', [Symptom, Plant]).

% Start system

start :-
    format('--- Plant Disease Diagnosis Expert System ---~n~n', []),
    perform_diagnosis(tomato),
    perform_diagnosis(potato),
    perform_diagnosis(rose).