

-- 5. List the names of students who have taken a course from department v6 (deptId), but not v7.
SELECT * FROM Student, 
	(SELECT studId FROM Transcript, Course WHERE deptId = @v6 AND Course.crsCode = Transcript.crsCode
	AND studId NOT IN
	(SELECT studId FROM Transcript, Course WHERE deptId = @v7 AND Course.crsCode = Transcript.crsCode)) as alias
WHERE Student.id = alias.studId;

-- Optimized code
Select s.name
from Student s, Transcript t, Course c
where t.crsCode= c.crsCode
and s.id = t.studId 
and c.deptId = @v6 and c.deptId <> @v7 ;