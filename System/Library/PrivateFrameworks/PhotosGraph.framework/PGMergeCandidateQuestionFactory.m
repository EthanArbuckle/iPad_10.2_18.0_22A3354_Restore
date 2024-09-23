@implementation PGMergeCandidateQuestionFactory

- (PGMergeCandidateQuestionFactory)initWithWorkingContext:(id)a3 questionVersion:(signed __int16)a4
{
  id v7;
  PGMergeCandidateQuestionFactory *v8;
  PGMergeCandidateQuestionFactory *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PGMergeCandidateQuestionFactory;
  v8 = -[PGMergeCandidateQuestionFactory init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_workingContext, a3);
    v9->_questionVersion = a4;
  }

  return v9;
}

- (PHFetchResult)persons
{
  PHFetchResult *persons;
  void *v4;
  PHFetchResult *v5;
  PHFetchResult *v6;

  persons = self->_persons;
  if (!persons)
  {
    -[PGManagerWorkingContext photoLibrary](self->_workingContext, "photoLibrary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[PGPeopleQuestionFactoryUtils personsWithPeopleHomeContextForPhotoLibrary:](PGPeopleQuestionFactoryUtils, "personsWithPeopleHomeContextForPhotoLibrary:", v4);
    v5 = (PHFetchResult *)objc_claimAutoreleasedReturnValue();
    v6 = self->_persons;
    self->_persons = v5;

    persons = self->_persons;
  }
  return persons;
}

- (unsigned)questionType
{
  return 2;
}

- (int64_t)questionOptions
{
  return 2;
}

- (id)generateQuestionsWithLimit:(unint64_t)a3 progressBlock:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t j;
  double v24;
  PGMergeCandidateQuestion *v25;
  void *v26;
  void *v27;
  id v29;
  void *v30;
  id obj;
  uint64_t v32;
  void *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  void *v42;
  _BYTE v43[128];
  _BYTE v44[128];
  _QWORD v45[4];

  v45[2] = *MEMORY[0x1E0C80C00];
  v29 = a4;
  -[PGMergeCandidateQuestionFactory persons](self, "persons");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGManagerWorkingContext photoLibrary](self->_workingContext, "photoLibrary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "librarySpecificFetchOptions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setFetchLimit:", 9);
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("faceCount"), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v45[0] = v8;
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("uuid"), 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v45[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v45, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setSortDescriptors:", v10);

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("verifiedType == %d"), 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = v7;
  objc_msgSend(v7, "setPredicate:", v11);

  v30 = (void *)objc_opt_new();
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  obj = v5;
  v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v44, 16);
  if (v12)
  {
    v13 = v12;
    v32 = *(_QWORD *)v39;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v39 != v32)
          objc_enumerationMutation(obj);
        v15 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);
        v16 = (void *)MEMORY[0x1CAA4EB2C]();
        objc_msgSend(MEMORY[0x1E0CD16C0], "fetchMergeCandidatePersonsForPerson:options:", v15, v33);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v17, "count"))
        {
          v36 = 0u;
          v37 = 0u;
          v34 = 0u;
          v35 = 0u;
          v18 = v17;
          v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v34, v43, 16);
          if (v19)
          {
            v20 = v19;
            v21 = 0;
            v22 = *(_QWORD *)v35;
            do
            {
              for (j = 0; j != v20; ++j)
              {
                if (*(_QWORD *)v35 != v22)
                  objc_enumerationMutation(v18);
                v21 += objc_msgSend(*(id *)(*((_QWORD *)&v34 + 1) + 8 * j), "faceCount");
              }
              v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v34, v43, 16);
            }
            while (v20);
          }
          else
          {
            v21 = 0;
          }

          v24 = (double)objc_msgSend(v15, "faceCount") / (double)v21;
          if (v24 > 0.0)
          {
            v25 = -[PGMergeCandidateQuestion initWithPerson:score:]([PGMergeCandidateQuestion alloc], "initWithPerson:score:", v15, v24);
            objc_msgSend(v30, "addObject:", v25);

          }
        }

        objc_autoreleasePoolPop(v16);
      }
      v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v44, 16);
    }
    while (v13);
  }

  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("score"), 0);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = v26;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v42, 1);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "sortUsingDescriptors:", v27);

  return v30;
}

- (void)setPersons:(id)a3
{
  objc_storeStrong((id *)&self->_persons, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_persons, 0);
  objc_storeStrong((id *)&self->_workingContext, 0);
}

@end
