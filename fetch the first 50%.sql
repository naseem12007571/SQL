SELECT *
    FROM WORKER
	WHERE WORKER_ID <= (SELECT count(WORKER_ID)/2 from Worker);