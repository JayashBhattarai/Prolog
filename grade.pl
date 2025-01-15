% Grade calculation rules
grade(Score, 'A') :- Score >= 80.
grade(Score, 'A-') :- Score >= 75, Score < 80.
grade(Score, 'B+') :- Score >= 70, Score < 75.
grade(Score, 'B') :- Score >= 65, Score < 70.
grade(Score, 'B-') :- Score >= 60, Score < 65.
grade(Score, 'C+') :- Score >= 55, Score < 60.
grade(Score, 'C') :- Score >= 50, Score < 55.
grade(Score, 'C-') :- Score >= 45, Score < 50.
grade(Score, 'D') :- Score >= 40, Score < 45.
grade(Score, 'Fail') :- Score < 40.

% Example query:
% ?- grade(85, Grade).
% Grade = 'A'.
% ?- grade(63, Grade).
% Grade = 'B-'.
% ?- grade(35, Grade).
% Grade = 'Fail'.


