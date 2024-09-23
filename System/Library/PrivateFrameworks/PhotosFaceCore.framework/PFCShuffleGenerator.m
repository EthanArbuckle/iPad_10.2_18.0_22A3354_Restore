@implementation PFCShuffleGenerator

- (PFCShuffleGenerator)init
{
  void *v3;
  PFCShuffleGenerator *v4;

  objc_msgSend(MEMORY[0x24BDE35F0], "sharedPhotoLibrary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[PFCShuffleGenerator initWithPhotoLibrary:targetShuffleSize:](self, "initWithPhotoLibrary:targetShuffleSize:", v3, 64);

  return v4;
}

- (PFCShuffleGenerator)initWithPhotoLibrary:(id)a3 targetShuffleSize:(int64_t)a4
{
  id v7;
  PFCShuffleGenerator *v8;
  PFCShuffleGenerator *v9;
  int64_t v10;
  PFCShuffleDataSource *v11;
  PFCShuffleDataSource *dataSource;
  uint64_t v13;
  NSMutableArray *shuffles;
  objc_super v16;

  v7 = a3;
  v16.receiver = self;
  v16.super_class = (Class)PFCShuffleGenerator;
  v8 = -[PFCShuffleGenerator init](&v16, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_photoLibrary, a3);
    v10 = 16;
    v9->_shuffleMinimumSuggestionRequired = 16;
    if ((unint64_t)a4 > 0x10)
      v10 = a4;
    v9->_targetShuffleSize = v10;
    v11 = -[PFCShuffleDataSource initWithPhotoLibrary:]([PFCShuffleDataSource alloc], "initWithPhotoLibrary:", v9->_photoLibrary);
    dataSource = v9->_dataSource;
    v9->_dataSource = v11;

    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v13 = objc_claimAutoreleasedReturnValue();
    shuffles = v9->_shuffles;
    v9->_shuffles = (NSMutableArray *)v13;

    -[PFCShuffleGenerator generateShufflesV2](v9, "generateShufflesV2");
  }

  return v9;
}

- (id)shuffles
{
  return (id)-[NSMutableArray copy](self->_shuffles, "copy");
}

- (void)generateShufflesV2
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  unint64_t v10;
  void *v11;
  unint64_t v12;
  unint64_t v13;
  void *v14;
  unint64_t v15;
  void *v16;
  void **v17;
  void *v18;
  void **v19;
  uint64_t v20;
  void *v21;
  id v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  int v27;
  char v28;
  char v29;
  char v30;
  uint64_t v31;
  uint64_t i;
  void *v33;
  unint64_t v34;
  uint64_t v35;
  void *v36;
  void *v37;
  uint64_t v38;
  PFCShuffle *v39;
  NSObject *v40;
  NSObject *v41;
  uint64_t v42;
  NSMutableArray *shuffles;
  void *v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  uint8_t buf[4];
  uint64_t v50;
  __int16 v51;
  NSMutableArray *v52;
  _BYTE v53[128];
  void *v54;
  _QWORD v55[2];
  void *v56;
  void *v57;
  _QWORD v58[3];

  v58[1] = *MEMORY[0x24BDAC8D0];
  -[PFCShuffleDataSource sortedTopAmbientPeople](self->_dataSource, "sortedTopAmbientPeople");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  if ((unint64_t)objc_msgSend(v4, "count") >= 2)
  {
    objc_msgSend(v4, "firstObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeObjectAtIndex:", 0);
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PFCShuffleGenerator shuffleForSubtype:persons:requireMinimumShuffleCount:](self, "shuffleForSubtype:persons:requireMinimumShuffleCount:", 804, v6, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      -[NSMutableArray addObject:](self->_shuffles, "addObject:", v7);
      pfc_shuffle_log();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v50 = (uint64_t)v5;
        _os_log_impl(&dword_243C21000, v8, OS_LOG_TYPE_INFO, "Did generate VIP shuffle for person: %@", buf, 0xCu);
      }

    }
  }
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(&unk_2514574C8, "count"))
  {
    v10 = 1;
    while (1)
    {
      objc_msgSend(&unk_2514574C8, "objectAtIndex:", v10 - 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = -[PFCShuffleDataSource numberOfSuggestionsForShuffleSubtype:persons:](self->_dataSource, "numberOfSuggestionsForShuffleSubtype:persons:", (unsigned __int16)objc_msgSend(v11, "unsignedIntegerValue"), 0);
      if (v12 >= 0x10)
        break;
LABEL_23:

      if (v10++ >= objc_msgSend(&unk_2514574C8, "count"))
        goto LABEL_25;
    }
    v13 = v12;
    if (v12 >= self->_targetShuffleSize)
    {
      v58[0] = v11;
      v18 = (void *)MEMORY[0x24BDBCE30];
      v19 = (void **)v58;
    }
    else
    {
      if (v10 < objc_msgSend(&unk_2514574C8, "count"))
      {
        objc_msgSend(&unk_2514574C8, "objectAtIndex:", v10);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = -[PFCShuffleDataSource numberOfSuggestionsForShuffleSubtype:persons:](self->_dataSource, "numberOfSuggestionsForShuffleSubtype:persons:", (unsigned __int16)objc_msgSend(v14, "unsignedIntegerValue"), 0);
        if (v15 > 0xF)
        {
          if (v15 + v13 >= self->_targetShuffleSize)
          {
            v55[0] = v11;
            v55[1] = v14;
            v16 = (void *)MEMORY[0x24BDBCE30];
            v17 = (void **)v55;
            v20 = 2;
            goto LABEL_21;
          }
          v54 = v11;
          v16 = (void *)MEMORY[0x24BDBCE30];
          v17 = &v54;
        }
        else
        {
          v56 = v11;
          v16 = (void *)MEMORY[0x24BDBCE30];
          v17 = &v56;
        }
        v20 = 1;
LABEL_21:
        objc_msgSend(v16, "arrayWithObjects:count:", v17, v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addObject:", v21);

        goto LABEL_22;
      }
      v57 = v11;
      v18 = (void *)MEMORY[0x24BDBCE30];
      v19 = &v57;
    }
    objc_msgSend(v18, "arrayWithObjects:count:", v19, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObject:", v14);
LABEL_22:

    goto LABEL_23;
  }
LABEL_25:
  v47 = 0u;
  v48 = 0u;
  v45 = 0u;
  v46 = 0u;
  v23 = v9;
  v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v45, v53, 16);
  v25 = v23;
  if (!v24)
    goto LABEL_50;
  v26 = v24;
  v44 = v4;
  v27 = 0;
  v28 = 0;
  v29 = 0;
  v30 = 0;
  v31 = *(_QWORD *)v46;
  do
  {
    for (i = 0; i != v26; ++i)
    {
      if (*(_QWORD *)v46 != v31)
        objc_enumerationMutation(v23);
      -[PFCShuffleGenerator shuffleForNonPersonSubtypes:requireMinimumShuffleCount:](self, "shuffleForNonPersonSubtypes:requireMinimumShuffleCount:", *(_QWORD *)(*((_QWORD *)&v45 + 1) + 8 * i), 1);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      if (v33)
      {
        -[NSMutableArray addObject:](self->_shuffles, "addObject:", v33);
        if ((v30 & 1) != 0)
        {
          v30 = 1;
          if ((v29 & 1) == 0)
            goto LABEL_33;
LABEL_35:
          v29 = 1;
        }
        else
        {
          v30 = objc_msgSend(v33, "pets");
          if ((v29 & 1) != 0)
            goto LABEL_35;
LABEL_33:
          v29 = objc_msgSend(v33, "nature");
        }
        ++v27;
        if ((v28 & 1) != 0)
          v28 = 1;
        else
          v28 = objc_msgSend(v33, "cityscape");
      }

    }
    v26 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v45, v53, 16);
  }
  while (v26);

  v4 = v44;
  if (v27 >= 2)
  {
    v34 = objc_msgSend(v44, "count");
    objc_msgSend(MEMORY[0x24BDBCF20], "set");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v44, "count"))
    {
      if (v34 >= 5)
        v35 = 5;
      else
        v35 = v34;
      v36 = (void *)MEMORY[0x24BDBCF20];
      objc_msgSend(v44, "subarrayWithRange:", 0, v35);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "setWithArray:", v37);
      v38 = objc_claimAutoreleasedReturnValue();

      v25 = (void *)v38;
    }
    v39 = -[PFCShuffle initWithPeople:pets:nature:cityscape:]([PFCShuffle alloc], "initWithPeople:pets:nature:cityscape:", v25, v30 & 1, v29 & 1, v28 & 1);
    -[NSMutableArray insertObject:atIndex:](self->_shuffles, "insertObject:atIndex:", v39, 0);
    pfc_shuffle_log();
    v40 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v50 = (uint64_t)v39;
      _os_log_impl(&dword_243C21000, v40, OS_LOG_TYPE_INFO, "[PFCShuffleGenerator]: Generated everything shuffle: %@", buf, 0xCu);
    }

LABEL_50:
  }
  pfc_shuffle_log();
  v41 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
  {
    v42 = -[NSMutableArray count](self->_shuffles, "count");
    shuffles = self->_shuffles;
    *(_DWORD *)buf = 134218242;
    v50 = v42;
    v51 = 2112;
    v52 = shuffles;
    _os_log_impl(&dword_243C21000, v41, OS_LOG_TYPE_DEFAULT, "[PFCShuffleGenerator]: Generated %ld shuffles\n%@", buf, 0x16u);
  }

}

- (void)generateShuffles
{
  void *v3;
  unint64_t v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  BOOL v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  __int128 v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  uint64_t v17;
  NSObject *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  unsigned int v23;
  NSObject *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  NSObject *v28;
  NSObject *v29;
  void *v30;
  PFCShuffle *v31;
  NSObject *v32;
  uint64_t v33;
  NSMutableArray *shuffles;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  uint8_t buf[4];
  uint64_t v41;
  __int16 v42;
  NSMutableArray *v43;
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  -[PFCShuffleDataSource topAmbientPeople](self->_dataSource, "topAmbientPeople");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4 < 2)
  {
    v9 = 0;
  }
  else
  {
    pfc_shuffle_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      -[PFCShuffleDataSource topAmbientPeople](self->_dataSource, "topAmbientPeople");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134217984;
      v41 = objc_msgSend(v6, "count");
      _os_log_impl(&dword_243C21000, v5, OS_LOG_TYPE_INFO, "Processing shuffle for %lu top people", buf, 0xCu);

    }
    -[PFCShuffleDataSource topAmbientPeople](self->_dataSource, "topAmbientPeople");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PFCShuffleGenerator shuffleForSubtype:persons:requireMinimumShuffleCount:](self, "shuffleForSubtype:persons:requireMinimumShuffleCount:", 804, v7, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = v8 != 0;
    if (v8)
    {
      pfc_shuffle_log();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v41 = (uint64_t)v8;
        _os_log_impl(&dword_243C21000, v10, OS_LOG_TYPE_INFO, "Did generate top people shuffle: %@", buf, 0xCu);
      }

      -[NSMutableArray addObject:](self->_shuffles, "addObject:", v8);
    }

  }
  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  -[PFCShuffleDataSource topAmbientPeople](self->_dataSource, "topAmbientPeople");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
  if (v12)
  {
    v14 = v12;
    v15 = *(_QWORD *)v37;
    *(_QWORD *)&v13 = 138412290;
    v35 = v13;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v37 != v15)
          objc_enumerationMutation(v11);
        v17 = *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * i);
        pfc_shuffle_log();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = v35;
          v41 = v17;
          _os_log_impl(&dword_243C21000, v18, OS_LOG_TYPE_INFO, "Processing shuffle for person id: %@", buf, 0xCu);
        }

        objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", v17);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[PFCShuffleGenerator shuffleForSubtype:persons:requireMinimumShuffleCount:](self, "shuffleForSubtype:persons:requireMinimumShuffleCount:", 804, v19, 1);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        if (v20)
        {
          pfc_shuffle_log();
          v21 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = v35;
            v41 = v17;
            _os_log_impl(&dword_243C21000, v21, OS_LOG_TYPE_INFO, "Did generate shuffle for person: %@", buf, 0xCu);
          }

          -[NSMutableArray addObject:](self->_shuffles, "addObject:", v20);
          v9 = 1;
        }

      }
      v14 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
    }
    while (v14);
  }

  -[PFCShuffleGenerator shuffleForSubtype:persons:requireMinimumShuffleCount:](self, "shuffleForSubtype:persons:requireMinimumShuffleCount:", 803, 0, 1);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v9;
  if (v22)
  {
    pfc_shuffle_log();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_243C21000, v24, OS_LOG_TYPE_INFO, "Did generate shuffle for pets", buf, 2u);
    }

    -[NSMutableArray addObject:](self->_shuffles, "addObject:", v22);
    if (v9)
      v23 = 2;
    else
      v23 = 1;
  }
  -[PFCShuffleGenerator shuffleForSubtype:persons:requireMinimumShuffleCount:](self, "shuffleForSubtype:persons:requireMinimumShuffleCount:", 801, 0, 1, v35);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (v25)
  {
    pfc_shuffle_log();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_243C21000, v26, OS_LOG_TYPE_INFO, "Did generate shuffle for nature", buf, 2u);
    }

    -[NSMutableArray addObject:](self->_shuffles, "addObject:", v25);
    ++v23;
  }
  -[PFCShuffleGenerator shuffleForSubtype:persons:requireMinimumShuffleCount:](self, "shuffleForSubtype:persons:requireMinimumShuffleCount:", 802, 0, 1);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  if (v27)
  {
    pfc_shuffle_log();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_243C21000, v28, OS_LOG_TYPE_INFO, "Did generate shuffle for cities", buf, 2u);
    }

    -[NSMutableArray addObject:](self->_shuffles, "addObject:", v27);
    ++v23;
  }
  if (v23 >= 2)
  {
    pfc_shuffle_log();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_243C21000, v29, OS_LOG_TYPE_DEFAULT, "[PFCShuffleGenerator] producing consolidated shuffle as well", buf, 2u);
    }

    if (v9)
      -[PFCShuffleDataSource topAmbientPeople](self->_dataSource, "topAmbientPeople");
    else
      objc_msgSend(MEMORY[0x24BDBCF20], "set");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = -[PFCShuffle initWithPeople:pets:nature:cityscape:]([PFCShuffle alloc], "initWithPeople:pets:nature:cityscape:", v30, v22 != 0, v25 != 0, v27 != 0);
    -[NSMutableArray insertObject:atIndex:](self->_shuffles, "insertObject:atIndex:", v31, 0);

  }
  pfc_shuffle_log();
  v32 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
  {
    v33 = -[NSMutableArray count](self->_shuffles, "count");
    shuffles = self->_shuffles;
    *(_DWORD *)buf = 134218242;
    v41 = v33;
    v42 = 2112;
    v43 = shuffles;
    _os_log_impl(&dword_243C21000, v32, OS_LOG_TYPE_DEFAULT, "[PFCShuffleGenerator]: Generated %ld shuffles\n%@", buf, 0x16u);
  }

}

- (id)shuffleForNonPersonSubtypes:(id)a3 requireMinimumShuffleCount:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  unint64_t v7;
  void *v8;
  uint64_t v9;
  __int128 v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  void *v18;
  int v19;
  NSObject *v20;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  PFCShuffle *v28;
  void *v29;
  NSObject *v30;
  PFCShuffle *v31;
  __int128 v33;
  uint64_t v34;
  id obj;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  uint8_t buf[4];
  void *v41;
  _BYTE v42[128];
  uint64_t v43;

  v4 = a4;
  v43 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  if (v4)
    v7 = 16;
  else
    v7 = 1;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  obj = v6;
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v42, 16);
  if (v9)
  {
    v11 = v9;
    v34 = 0;
    v12 = 0;
    v13 = *(_QWORD *)v37;
    *(_QWORD *)&v10 = 138412290;
    v33 = v10;
LABEL_6:
    v14 = 0;
    while (2)
    {
      v15 = v12;
      if (*(_QWORD *)v37 != v13)
        objc_enumerationMutation(obj);
      v16 = (unsigned __int16)objc_msgSend(*(id *)(*((_QWORD *)&v36 + 1) + 8 * v14), "unsignedIntegerValue", v33);
      v17 = -[PFCShuffleDataSource numberOfSuggestionsForShuffleSubtype:persons:](self->_dataSource, "numberOfSuggestionsForShuffleSubtype:persons:", v16, 0);
      PHSuggestionStringWithSubtype();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addObject:", v18);
      if (v17 >= v7)
      {
        v19 = v16 - 801;
        v12 = 1;
        switch(v19)
        {
          case 0:
            LODWORD(v34) = 1;
            goto LABEL_16;
          case 1:
            HIDWORD(v34) = 1;
            goto LABEL_16;
          case 2:
            goto LABEL_17;
          case 3:
            goto LABEL_23;
          default:
            pfc_shuffle_log();
            v20 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = v33;
              v41 = v18;
              _os_log_error_impl(&dword_243C21000, v20, OS_LOG_TYPE_ERROR, "[PFCShuffleGenerator] bad shuffle subtype: %@", buf, 0xCu);
            }

LABEL_16:
            v12 = v15;
LABEL_17:

            if (v11 != ++v14)
              continue;
            v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v42, 16);
            if (!v11)
              goto LABEL_25;
            goto LABEL_6;
        }
      }
      break;
    }
    pfc_shuffle_log();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      -[PFCShuffleGenerator shuffleForNonPersonSubtypes:requireMinimumShuffleCount:].cold.1((uint64_t)v18, v21, v22, v23, v24, v25, v26, v27);

LABEL_23:
    v28 = 0;
    v29 = obj;
  }
  else
  {
    v34 = 0;
    LODWORD(v12) = 0;
LABEL_25:

    objc_msgSend(v8, "componentsJoinedByString:", CFSTR(","));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    pfc_shuffle_log();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v41 = v29;
      _os_log_impl(&dword_243C21000, v30, OS_LOG_TYPE_DEFAULT, "[PFCShuffleGenerator] Generated shuffle for subtypes (%@)", buf, 0xCu);
    }

    if (((v12 | v34 | HIDWORD(v34)) & 1) == 0)
    {
      v28 = 0;
      goto LABEL_30;
    }
    v31 = [PFCShuffle alloc];
    objc_msgSend(MEMORY[0x24BDBCF20], "set");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = -[PFCShuffle initWithPeople:pets:nature:cityscape:](v31, "initWithPeople:pets:nature:cityscape:", v18, v12 & 1, v34 & 1, BYTE4(v34) & 1);
  }

LABEL_30:
  return v28;
}

- (id)shuffleForSubtype:(unsigned __int16)a3 persons:(id)a4 requireMinimumShuffleCount:(BOOL)a5
{
  _BOOL4 v5;
  uint64_t v6;
  id v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  PFCShuffle *v12;
  void *v13;
  PFCShuffle *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  PFCShuffle *v25;
  PFCShuffle *v26;
  uint64_t v27;
  PFCShuffle *v28;
  int v30;
  void *v31;
  __int16 v32;
  id v33;
  uint64_t v34;

  v5 = a5;
  v6 = a3;
  v34 = *MEMORY[0x24BDAC8D0];
  v8 = a4;
  PHSuggestionStringWithSubtype();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  pfc_shuffle_log();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v30 = 138412546;
    v31 = v9;
    v32 = 2112;
    v33 = v8;
    _os_log_impl(&dword_243C21000, v10, OS_LOG_TYPE_DEFAULT, "[PFCShuffleGenerator] Fetching suggestion with subtype (%@), personLocalIdentifiers %@", (uint8_t *)&v30, 0x16u);
  }

  if (v5)
    v11 = 16;
  else
    v11 = 1;
  if (-[PFCShuffleDataSource hasSuggestionsForShuffleSubtype:persons:minimumCount:](self->_dataSource, "hasSuggestionsForShuffleSubtype:persons:minimumCount:", v6, v8, v11))
  {
    switch((int)v6)
    {
      case 801:
        v12 = [PFCShuffle alloc];
        objc_msgSend(MEMORY[0x24BDBCF20], "set");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = v12;
        v15 = v13;
        v16 = 0;
        v17 = 1;
        goto LABEL_16;
      case 802:
        v26 = [PFCShuffle alloc];
        objc_msgSend(MEMORY[0x24BDBCF20], "set");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = v26;
        v15 = v13;
        v16 = 0;
        v17 = 0;
        v27 = 1;
        goto LABEL_17;
      case 803:
        v28 = [PFCShuffle alloc];
        objc_msgSend(MEMORY[0x24BDBCF20], "set");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = v28;
        v15 = v13;
        v16 = 1;
        v17 = 0;
LABEL_16:
        v27 = 0;
LABEL_17:
        v25 = -[PFCShuffle initWithPeople:pets:nature:cityscape:](v14, "initWithPeople:pets:nature:cityscape:", v15, v16, v17, v27);

        break;
      case 804:
        v25 = -[PFCShuffle initWithPeople:pets:nature:cityscape:]([PFCShuffle alloc], "initWithPeople:pets:nature:cityscape:", v8, 0, 0, 0);
        break;
      default:
        pfc_shuffle_log();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          -[PFCShuffleGenerator shuffleForSubtype:persons:requireMinimumShuffleCount:].cold.1((uint64_t)v9, v18, v19, v20, v21, v22, v23, v24);
        goto LABEL_13;
    }
  }
  else
  {
    pfc_shuffle_log();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      v30 = 138412546;
      v31 = v9;
      v32 = 2112;
      v33 = v8;
      _os_log_impl(&dword_243C21000, v18, OS_LOG_TYPE_DEFAULT, "[PFCShuffleGenerator] No suggestions for subtype (%@), personLocalIdentifiers %@", (uint8_t *)&v30, 0x16u);
    }
LABEL_13:

    v25 = 0;
  }

  return v25;
}

- (id)baseSuggestionFetchOptionsWithSubtype:(unsigned __int16)a3 personLocalIdentifiers:(id)a4
{
  unsigned int v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v19[2];
  _QWORD v20[3];

  v4 = a3;
  v20[2] = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  -[PHPhotoLibrary librarySpecificFetchOptions](self->_photoLibrary, "librarySpecificFetchOptions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:", CFSTR("creationDate"), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v8;
  objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:", CFSTR("uuid"), 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v20[1] = v9;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v20, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setSortDescriptors:", v10);

  v11 = objc_alloc(MEMORY[0x24BDBCEB8]);
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("%K != %d"), CFSTR("state"), 4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v12;
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("%K = %d"), CFSTR("subtype"), v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v19[1] = v13;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v19, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v11, "initWithArray:", v14);

  if (v6)
  {
    objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("%K IN %@"), CFSTR("context"), v6);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addObject:", v16);

  }
  objc_msgSend(MEMORY[0x24BDD14C0], "andPredicateWithSubpredicates:", v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setPredicate:", v17);

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shuffles, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
}

- (void)shuffleForNonPersonSubtypes:(uint64_t)a3 requireMinimumShuffleCount:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_243C21000, a2, a3, "[PFCShuffleGenerator] Not enough suggestions for subtype (%@)", a5, a6, a7, a8, 2u);
}

- (void)shuffleForSubtype:(uint64_t)a3 persons:(uint64_t)a4 requireMinimumShuffleCount:(uint64_t)a5 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_243C21000, a2, a3, "[PFCShuffleGenerator] bad shuffle subtype: %@", a5, a6, a7, a8, 2u);
}

@end
