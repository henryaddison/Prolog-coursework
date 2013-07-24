% db.pl


% The following line is a meta-Prolog directive for managing
% the facts below.
:- discontiguous foundationCourse/2, specialisedCourse/2,
   lectures/4, lecturer/2. 



%
% foundationCourse(CID, N).
%
foundationCourse(ip,   'Introduction to C++ Programming').
foundationCourse(cs,   'Computer Systems').
foundationCourse(oodp, 'Object Oriented Design & Programming').
foundationCourse(laip,  'Logic and AI Programming').

%foundationCourse( ijc, 'Introductory Java Course').
% You can ignore the 'Introductory Java Course'.
%
% specialisedCourse(CID, N).
%
specialisedCourse(ca,  'Computer Architecture').
specialisedCourse(ai,  'Introduction to Artificial Intelligence').
specialisedCourse(cf,  'Computational Finance').
specialisedCourse(cnds,'Computer Networks and Distributed Systems').
specialisedCourse(conc, 'Concurrency').
specialisedCourse(db,  'Databases').
specialisedCourse(ib,  'Introduction to Bioinformatics').
specialisedCourse(se,  'Software Engineering').
specialisedCourse(sep,  'Software Engineering Practice').
specialisedCourse(rb,  'Robotics').
specialisedCourse(gr,  'Graphics').
specialisedCourse(lc,  'Ludic Computing').
specialisedCourse(ml,  'Machine Learning').
specialisedCourse(pa,  'Performance Analysis').

% Question 2 Student Facts
% student(L, FN) where L is student login and FN is student's full name
%me
student(hja11, 'Henry John Addison').
student(ggm82, 'Gabrial Garcia Marquez').
student(hp05, 'Harold Pinter').
student(sh95, 'Seamus Heaney').
student(jmc03, 'John M Coetzee').


% Question 3 Enrolled Facts
% Enrolling each of the above students on 4 specialised courses
enrolled(hja11, ai).
enrolled(hja11, ml).
enrolled(hja11, cnds).
enrolled(hja11, db).
enrolled(ggm82, ca).
enrolled(ggm82, ai).
enrolled(ggm82, cf).
enrolled(ggm82, cnds).
enrolled(hp05, conc).
enrolled(hp05, db).
enrolled(hp05, ib).
enrolled(hp05, se).
enrolled(sh95, sep).
enrolled(sh95, rb).
enrolled(sh95, gr).
enrolled(sh95, lc).
enrolled(jmc03, ml).
enrolled(jmc03, pa).
enrolled(jmc03, ca).
enrolled(jmc03, ai).

% Any other lectures in your time-table for which the course-type
% (specialised or foundation) is unknown can be safely ignored
% for the purpose of this lab exercise.


% 
% lectures(LId,CId,S,F). facts for term 1
% If there are entries on the timetable different from these you can ignore them.

lectures(wjk,   ip,    1,  2).
lectures(eedwards,    cs,    3,  9).
lectures(kkleung,    cs,    3,  9).
% axgopala NOT defined as lecturer below
lectures(axgopala,  cs,   3,  11).
lectures(dirk,   cs,    3, 11). 
lectures(wjk, oodp,  3,  11).
% ajchung NOT defined as lecturer below
lectures(ajchung, oodp,  3,  11).
lectures(fs,    laip,   3,  11). 
 
% 
% some lectures(LId,CId,S,F) facts for term 2
% If there are some missing you can ignore them or add them to complete the 
% data using the timetable at:
% http://www.doc.ic.ac.uk/teaching/timetables/spring/class/13_2_12.htm


lectures(mss,cnds,2,10).
lectures(prp,cnds,2,10).
lectures(cristic,sep,2,11).
lectures(wl,ca,2,10).
% maja NOT defined as lecturer below
lectures(maja,ml,2,10).
lectures(shm,ml,2,10).
lectures(sgc,ai,2,10).
lectures(ft,ai,2,10).
lectures(ajd,rb,2,10).
lectures(ar3,se,2,10).
lectures(ecl1,se,2,10).
lectures(jj,db,2,10).
lectures(jb,pa,2,10).
lectures(pgh,pa,2,10).
lectures(dfg,gr,2,10).
lectures(dr,gr,2,10).
lectures(natasha,ib,2,10).
lectures(jk,conc,2,10).
lectures(su2,conc,2,10).
lectures(sgc,lc,2,10).
lectures(dkuhn,cf,2,10).

% ... more?


% the following lecturer(LId,N) should include all who lecture you;
% add extra facts if not.
% You can find the full name from a lecturer's short name by looking
% up the lecturer's short name at the following URL:
% http://www3.imperial.ac.uk/computing/people

lecturer(ajd    , 'Andrew Davison').
lecturer(alw,    'Alex Wolf').
lecturer(ar3    , 'Alessandra Russo').
lecturer(ccris	, 'Cristiano Calcagno').
lecturer(dfg    , 'Duncan Gillies').
lecturer(dirk	, 'Dirk Pattinson').
lecturer(dkuhn     , 'Daniel Kuhn').
lecturer(dr     , 'Daniel Rueckert').
lecturer(ecl1   , 'Emil Lupu').
lecturer(eedwards, 'Eddie Edwards').
lecturer(frk    , 'Frank Kriwaczek').
lecturer(fs     , 'Fariba Sadri').
lecturer(jamm	, 'Julie McCann').
lecturer(jj     , 'James Jacobson').
lecturer(jk	, 'Jeff Kramer').
lecturer(kkleung,    'Kin Leung').
lecturer(mgv98,    'Maria Vigliotti').
lecturer(mss     , 'Morris Sloman').
lecturer(nd     , 'Naranker Dulay').
lecturer(nps	, 'Pete Sedcole').
lecturer(nr600,    'Nikolaos Rizopoulos').
lecturer(oskar	, 'Oskar Mencer').
lecturer(phjk   , 'Paul Kelly').
lecturer(prp     , 'Peter Pietzuch').
lecturer(pp500  , 'Panos Parpas').
lecturer(scd     , 'Sophia Drossopoulu').
lecturer(sgc    , 'Simon Colton').
lecturer(su2    , 'Sebastian Uchitel').
lecturer(wl,    'Wayne Luk').
lecturer(wjk    , 'William Knottenbelt').
lecturer(yg     , 'Yike Guo').
lecturer(natasha    , 'Natasa Przulj').
lecturer(shm     , 'Stephen Muggleton').
lecturer(ft   , 'Francesca Toni').
lecturer(pgh     , 'Peter Harrison').
lecturer(jb     , 'Jeremy Bradley').
lecturer(cristic     , 'Cristian Cadar').

% You need to update this file in order to complete the exercise.
% To answer the questions that ask you to add facts, add new facts
% or extend the lists of existing facts above.  To answer the
% questions that ask you to add rules, define and add your rules below.

% Question 1
% Define course(SCN,FCN,T) so that course with short name SCN and full name FCN is taught in term T
course(SCN,FCN,1):-foundationCourse(SCN,FCN).
course(SCN,FCN,2):-specialisedCourse(SCN,FCN).

% Question 3
% Define enrolled(SI, SCN) so that every student (identifed by login SI) takes every foundation course
enrolled(SI,SCN):-foundationCourse(SCN,FCN).

% Question 4
% Define taughtBy(SI,LN) so that LN are the lecturer names of the course taken by student identified by SI
taughtBy(SI,LN):-enrolled(SI,SCN),lecturer(LI,LN),lectures(LI,SCN,S,F).

% Question 5
% define mcsLecturer(LNm) so that LNm is the name of a lecturer who lectures at least one course
mcsLecturer(LNm):-lecturer(LI,LNm),lectures(LI,SCN,S,F).

% Question 6
% define optionFor(SI,CN) so that CN names a specialised course for which student with ID SI is enrolled
optionFor(SI,CN):-enrolled(SI,SCN),course(SCN,CN, T).

%Question 7
% define takesOptions(SI,SN,OptCourses) so that OptCourses is the list of full names of the specialised courses taken by student named SN with login SI. OptCourses is in alphabetical order
:-use_module(library(lists)).
takesOptions(SI,SN,OptCourses):-student(SI,SN),setof(FCN, (SCN^(enrolled(SI,SCN),specialisedCourse(SCN,FCN))),OptCourses).

% Question 8
% define lecturesOnAll(LI,LN,Courses) so that Courses is alphabetically sorted list of fill courses names lectured by lectures with ID LI and name LN
lecturesOnAll(LI,LN,Courses):-lecturer(LI,LN),setof(FCN, SCN^S^F^T^(lectures(LI,SCN,S,F),course(SCN,FCN,T)), Courses).

% Question 9
% define studentsOnCourse(SCN,CN,Students) so that for specialised course with short name SCN and full name CN, Students if a list of pairs where the pairs are a SI for a student taking the course and the second element is an ordered list of all other specialised courses enrolled in by the student. Students is alphabetically sorted by student SI.
studentsOnCourse(SCN,CN,Students):-specialisedCourse(SCN,CN),setof(SI-OtherCourses,(enrolled(SI,SCN),setof(OtherFCN,OtherSCN^(specialisedCourse(OtherSCN,OtherFCN),enrolled(SI,OtherSCN),OtherSCN\=SCN),OtherCourses)),Students).

% Question 10
% defined lecturesInWeek(LI, T, N) so that Lecturer with ID LI is lecturing in week N of term T
lecturesInWeek(LI, T, N):-course(SCN,FCN,T),lectures(LI,SCN,X,Y),X=<N,(Y>=N).
