# Plant Disease Diagnosis Expert System

This is a simple rule-based expert system made using **Prolog**. It checks the symptoms of a plant and identifies a possible disease based on predefined rules.

## Features

* Checks plant symptoms
* Identifies possible diseases
* Gives basic treatment recommendations
* Uses Prolog facts and rules
* Uses `assertz/1` and `retract/1` for updating symptoms

## Technologies Used

* Prolog
* SWI-Prolog
* No external libraries or datasets

## Plants Covered

* Tomato – Leaf Blight
* Potato – Early Blight
* Rose – Powdery Mildew

## How to Run

Open `expert.pl` in SWI-Prolog and load the file:

```prolog
?- ["D:/prolog/expert.pl"].
```

Then run:

```prolog
?- start.
```

## Project Files

```text
Plant-Disease-Expert-System/
├── expert.pl
└── README.md
```

## Note

The system is made for educational purposes and uses a small predefined set of symptoms and diseases.
