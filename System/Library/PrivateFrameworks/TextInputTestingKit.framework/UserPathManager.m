@implementation UserPathManager

- (UserPathManager)initWithPathFile:(id)a3
{
  id v5;
  UserPathManager *v6;
  UserPathManager *v7;
  uint64_t v8;
  TTKTestCaseSource *source;
  uint64_t v10;
  NSMutableDictionary *transforms;
  uint64_t v12;
  NSMutableDictionary *lookupTree;
  uint64_t v14;
  unsigned int v15;
  uint64_t i;
  UserPathManager *v17;
  objc_super v19;

  v5 = a3;
  v19.receiver = self;
  v19.super_class = (Class)UserPathManager;
  v6 = -[UserPathManager init](&v19, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_pathFile, a3);
    +[TTKTestCaseReader loadFromPath:](TTKTestCaseReader, "loadFromPath:", v5);
    v8 = objc_claimAutoreleasedReturnValue();
    source = v7->_source;
    v7->_source = (TTKTestCaseSource *)v8;

    if (!v7->_source)
    {
      fprintf((FILE *)*MEMORY[0x24BDAC8D8], "Error: Unable to parse user path JSON file '%s'\n\n", (const char *)objc_msgSend(objc_retainAutorelease(v5), "cStringUsingEncoding:", 4));
      v17 = 0;
      goto LABEL_8;
    }
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v10 = objc_claimAutoreleasedReturnValue();
    transforms = v7->_transforms;
    v7->_transforms = (NSMutableDictionary *)v10;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v12 = objc_claimAutoreleasedReturnValue();
    lookupTree = v7->_lookupTree;
    v7->_lookupTree = (NSMutableDictionary *)v12;

    -[UserPathManager buildLookupTree](v7, "buildLookupTree");
    v14 = operator new();
    v15 = 5489;
    *(_DWORD *)v14 = 5489;
    for (i = 1; i != 624; ++i)
    {
      v15 = i + 1812433253 * (v15 ^ (v15 >> 30));
      *(_DWORD *)(v14 + 4 * i) = v15;
    }
    *(_QWORD *)(v14 + 2496) = 0;
    v7->m_generator = (void *)v14;
    -[UserPathManager setRandomNumberSeed:](v7, "setRandomNumberSeed:", 0);
  }
  v17 = v7;
LABEL_8:

  return v17;
}

- (void)dealloc
{
  void *m_generator;
  objc_super v4;

  m_generator = self->m_generator;
  if (m_generator)
    MEMORY[0x2348A8A24](m_generator, 0x1000C407BAC9B3ELL);
  v4.receiver = self;
  v4.super_class = (Class)UserPathManager;
  -[UserPathManager dealloc](&v4, sel_dealloc);
}

- (void)setRandomNumberSeed:(unsigned int)a3
{
  _DWORD *m_generator;
  uint64_t i;

  m_generator = self->m_generator;
  *m_generator = a3;
  for (i = 1; i != 624; ++i)
  {
    a3 = i + 1812433253 * (a3 ^ (a3 >> 30));
    m_generator[i] = a3;
  }
  *((_QWORD *)m_generator + 312) = 0;
}

- (BOOL)computeTranslations:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v15;
  void *v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[TTKTestCaseSource layouts](self->_source, "layouts");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "keyplane");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "name");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v6 = v15;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v19 != v8)
          objc_enumerationMutation(v6);
        v10 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(v6, "objectForKey:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "keys");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[UserPathManager translateLayoutForKeys:keyboardController:](self, "translateLayoutForKeys:keyboardController:", v12, v4);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v13)
          objc_msgSend(v17, "setObject:forKey:", v13, v10);

      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v7);
  }

  -[NSMutableDictionary setObject:forKey:](self->_transforms, "setObject:forKey:", v17, v16);
  return 1;
}

- (id)translateLayoutForKeys:(id)a3 keyboardController:(id)a4
{
  id v5;
  __int128 v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  double v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  id v23;
  id v24;
  id v25;
  id v26;
  void *v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double MidX;
  CGFloat v39;
  CGFloat v40;
  CGFloat v41;
  CGFloat v42;
  double v43;
  double v44;
  float v45;
  float v46;
  void *v47;
  double v49;
  double v50;
  id v51;
  id obj;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  double v57[4];
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  _QWORD v62[6];
  _QWORD v63[5];
  id v64;
  _QWORD v65[6];
  __int128 v66;
  __int128 v67;
  float v68;
  float v69;
  float v70[4];
  float v71;
  float v72;
  _DWORD v73[4];
  _BYTE v74[128];
  uint64_t v75;
  CGRect v76;
  CGRect v77;
  CGRect v78;
  CGRect v79;

  v75 = *MEMORY[0x24BDAC8D0];
  v51 = a3;
  v5 = a4;
  v65[0] = 0;
  v65[1] = v65;
  v65[3] = __Block_byref_object_copy__1349;
  v65[4] = __Block_byref_object_dispose__1350;
  v65[5] = &unk_22FAD47AA;
  v65[2] = 0x5012000000;
  v6 = *(_OWORD *)(MEMORY[0x24BDBF070] + 16);
  v66 = *MEMORY[0x24BDBF070];
  v67 = v6;
  v63[0] = 0;
  v63[1] = v63;
  v63[2] = 0x3032000000;
  v63[3] = __Block_byref_object_copy__15;
  v63[4] = __Block_byref_object_dispose__16;
  v64 = 0;
  objc_msgSend(v5, "keyplane");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "keys");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v62[0] = MEMORY[0x24BDAC760];
  v62[1] = 3221225472;
  v62[2] = __61__UserPathManager_translateLayoutForKeys_keyboardController___block_invoke;
  v62[3] = &unk_24FD49210;
  v62[4] = v63;
  v62[5] = v65;
  objc_msgSend(v8, "enumerateObjectsUsingBlock:", v62);

  v58 = 0u;
  v59 = 0u;
  v60 = 0u;
  v61 = 0u;
  obj = v51;
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v58, v74, 16);
  if (v9)
  {
    v53 = 0;
    v54 = 0;
    v55 = 0;
    v56 = 0;
    v10 = *(_QWORD *)v59;
    v11 = 1000000000.0;
    v12 = 1000000000.0;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v59 != v10)
          objc_enumerationMutation(obj);
        v14 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * i);
        objc_msgSend(v14, "string");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "layoutUtils");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "keyplane");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "exactKeyForString:keyplane:", v15, v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        if (v18)
        {
          objc_msgSend(v18, "frame");
          +[TITesterMathUtils distanceBetween:andPoint:](TITesterMathUtils, "distanceBetween:andPoint:");
          v20 = v19;
          objc_msgSend(v18, "frame");
          +[TITesterMathUtils distanceBetween:andPoint:](TITesterMathUtils, "distanceBetween:andPoint:");
          v22 = v21;
          if (v12 > v20)
          {
            v23 = v18;

            v24 = v14;
            v12 = v20;
            v54 = v23;
            v56 = v24;
          }
          if (v11 > v22)
          {
            v25 = v18;

            v26 = v14;
            v11 = v22;
            v53 = v25;
            v55 = v26;
          }
        }

      }
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v58, v74, 16);
    }
    while (v9);

    v27 = 0;
    if (v56 && v55)
    {
      objc_msgSend(v54, "frame");
      v50 = v28;
      objc_msgSend(v54, "frame");
      v49 = v29;
      objc_msgSend(v54, "frame");
      objc_msgSend(v54, "frame");
      objc_msgSend(v53, "frame");
      v31 = v30;
      objc_msgSend(v53, "frame");
      v33 = v32;
      objc_msgSend(v53, "frame");
      objc_msgSend(v53, "frame");
      objc_msgSend(v56, "frame");
      x = v76.origin.x;
      y = v76.origin.y;
      width = v76.size.width;
      height = v76.size.height;
      MidX = CGRectGetMidX(v76);
      v77.origin.x = x;
      v77.origin.y = y;
      v77.size.width = width;
      v77.size.height = height;
      objc_msgSend(v55, "frame", CGRectGetMidY(v77));
      v39 = v78.origin.x;
      v40 = v78.origin.y;
      v41 = v78.size.width;
      v42 = v78.size.height;
      v43 = CGRectGetMidX(v78);
      v79.origin.x = v39;
      v79.origin.y = v40;
      v79.size.width = v41;
      v79.size.height = v42;
      CGRectGetMidY(v79);
      v44 = v31 + v33 * 0.5;
      *(float *)&v39 = MidX;
      v73[0] = LODWORD(v39);
      v73[1] = 1065353216;
      v45 = v43;
      *(float *)&v73[2] = v45;
      v73[3] = 1065353216;
      *(float *)&v31 = v50 + v49 * 0.5;
      v46 = v44;
      v71 = *(float *)&v31;
      v72 = v46;
      if (+[TITesterMathUtils solveSystemOfEquations:withBMatrix:size:](TITesterMathUtils, "solveSystemOfEquations:withBMatrix:size:", v73, &v71, 2)|| (v70[0] = MidX, v70[1] = 1.0, v70[2] = v45, v70[3] = 1.0, v68 = v50 + v49 * 0.5, v69 = v46, +[TITesterMathUtils solveSystemOfEquations:withBMatrix:size:](TITesterMathUtils, "solveSystemOfEquations:withBMatrix:size:", v70, &v68, 2)))
      {
        v27 = 0;
      }
      else
      {
        v57[0] = v71;
        v57[1] = v68;
        v57[2] = v72;
        v57[3] = v69;
        objc_msgSend(MEMORY[0x24BDD1968], "value:withObjCType:", v57, "{?=dddd}");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
      }
    }
    v47 = v53;
  }
  else
  {

    v55 = 0;
    v56 = 0;
    v54 = 0;
    v47 = 0;
    v27 = 0;
  }

  _Block_object_dispose(v63, 8);
  _Block_object_dispose(v65, 8);

  return v27;
}

- (BOOL)buildLookupTree
{
  void *v2;
  void *v3;
  void *v4;
  TIContinuousPathWithLayoutName *v5;
  void *v6;
  TIContinuousPathWithLayoutName *v7;
  void *v8;
  uint64_t v9;
  float v10;
  uint64_t k;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t m;
  void *v17;
  double v18;
  TIContinuousPathSample *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  TIContinuousPathSample *v25;
  void *v26;
  uint64_t v28;
  UserPathManager *i;
  uint64_t v30;
  id obj;
  void *v32;
  void *v33;
  uint64_t j;
  id v35;
  uint64_t v36;
  uint64_t v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _BYTE v50[128];
  _BYTE v51[128];
  _BYTE v52[128];
  uint64_t v53;

  v2 = 0;
  v53 = *MEMORY[0x24BDAC8D0];
  for (i = self; ; self = i)
  {
    -[TTKTestCaseSource getNextTestCase](self->_source, "getNextTestCase", v28);
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v32)
      break;
    objc_msgSend(v32, "records");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = 0u;
    v49 = 0u;
    v46 = 0u;
    v47 = 0u;
    obj = v3;
    v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v52, 16);
    if (v28)
    {
      v30 = *(_QWORD *)v47;
      do
      {
        for (j = 0; j != v28; ++j)
        {
          if (*(_QWORD *)v47 != v30)
            objc_enumerationMutation(obj);
          v4 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * j);
          objc_msgSend(v4, "primaryIntendedText", v28);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v5 = [TIContinuousPathWithLayoutName alloc];
          objc_msgSend(v4, "layoutName");
          v6 = (void *)objc_claimAutoreleasedReturnValue();
          v7 = -[TIContinuousPathWithLayoutName initWithLayout:](v5, "initWithLayout:", v6);

          objc_msgSend(v4, "touchDataCollection");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          v44 = 0u;
          v45 = 0u;
          v42 = 0u;
          v43 = 0u;
          v35 = v8;
          v9 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v42, v51, 16);
          if (v9)
          {
            v36 = *(_QWORD *)v43;
            v10 = -1.0;
            do
            {
              v37 = v9;
              for (k = 0; k != v37; ++k)
              {
                if (*(_QWORD *)v43 != v36)
                  objc_enumerationMutation(v35);
                v12 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * k);
                v38 = 0u;
                v39 = 0u;
                v40 = 0u;
                v41 = 0u;
                objc_msgSend(v12, "samples");
                v13 = (void *)objc_claimAutoreleasedReturnValue();
                v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v38, v50, 16);
                if (v14)
                {
                  v15 = *(_QWORD *)v39;
                  do
                  {
                    for (m = 0; m != v14; ++m)
                    {
                      if (*(_QWORD *)v39 != v15)
                        objc_enumerationMutation(v13);
                      v17 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * m);
                      if (v10 < 0.0)
                      {
                        objc_msgSend(*(id *)(*((_QWORD *)&v38 + 1) + 8 * m), "timeStamp");
                        v10 = v18;
                      }
                      v19 = [TIContinuousPathSample alloc];
                      objc_msgSend(v17, "point");
                      v21 = v20;
                      v23 = v22;
                      objc_msgSend(v17, "timeStamp");
                      v25 = -[TIContinuousPathSample initWithPoint:timeStamp:force:radius:stage:pathIndex:](v19, "initWithPoint:timeStamp:force:radius:stage:pathIndex:", objc_msgSend(v17, "stage"), objc_msgSend(v17, "pathIndex"), v21, v23, v24 - v10, 0.0, 0.0);
                      -[TIContinuousPath addSample:](v7, "addSample:", v25);

                    }
                    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v38, v50, 16);
                  }
                  while (v14);
                }

              }
              v9 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v42, v51, 16);
            }
            while (v9);
          }

          -[NSMutableDictionary objectForKey:](i->_lookupTree, "objectForKey:", v33);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v26)
          {
            objc_msgSend(MEMORY[0x24BDBCEB8], "array");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSMutableDictionary setObject:forKey:](i->_lookupTree, "setObject:forKey:");
          }
          objc_msgSend(v26, "addObject:", v7);

        }
        v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v52, 16);
      }
      while (v28);
    }

    v2 = v32;
  }
  return 1;
}

- (id)lookup:(id)a3 keyboardController:(id)a4
{
  void *v6;
  NSMutableDictionary *lookupTree;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  TIContinuousPathWithLayoutName *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  TIContinuousPathSample *v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  TIContinuousPathSample *v33;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  id v39;
  void *v40;
  double v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _QWORD v46[4];
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
  v38 = a3;
  v39 = a4;
  -[NSMutableDictionary objectForKey:](self->_lookupTree, "objectForKey:", v38);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6
    || (lookupTree = self->_lookupTree,
        objc_msgSend(v38, "lowercaseString"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        -[NSMutableDictionary objectForKey:](lookupTree, "objectForKey:", v8),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    v35 = v6;
    objc_msgSend(v6, "objectAtIndex:", std::mersenne_twister_engine<unsigned int,32ul,624ul,397ul,31ul,2567483615u,11ul,4294967295u,7ul,2636928640u,15ul,4022730752u,18ul,1812433253u>::operator()((std::mersenne_twister_engine<unsigned int, 32, 624, 397, 31, 2567483615, 11, 4294967295, 7, 2636928640, 15, 4022730752, 18, 1812433253> *)self->m_generator)% (unint64_t)objc_msgSend(v6, "count"));
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "keyplane");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "name");
    v10 = objc_claimAutoreleasedReturnValue();

    v37 = (void *)v10;
    -[NSMutableDictionary objectForKey:](self->_transforms, "objectForKey:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v11)
    {
      -[UserPathManager computeTranslations:](self, "computeTranslations:", v39);
      -[NSMutableDictionary objectForKey:](self->_transforms, "objectForKey:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v40, "layout");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKey:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v36 = v13;
    if (v13)
    {
      objc_msgSend(v13, "getValue:", v46);
      v14 = objc_alloc_init(TIContinuousPathWithLayoutName);
      v44 = 0u;
      v45 = 0u;
      v42 = 0u;
      v43 = 0u;
      objc_msgSend(v40, "samples");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v42, v47, 16);
      if (v16)
      {
        v17 = *(_QWORD *)v43;
        do
        {
          for (i = 0; i != v16; ++i)
          {
            if (*(_QWORD *)v43 != v17)
              objc_enumerationMutation(v15);
            v19 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * i);
            objc_msgSend(v19, "point");
            v21 = v20;
            v22 = *(double *)v46;
            v23 = *(double *)&v46[2];
            objc_msgSend(v19, "point");
            v25 = v24;
            v41 = *(double *)&v46[1];
            v26 = *(double *)&v46[3];
            v27 = [TIContinuousPathSample alloc];
            objc_msgSend(v19, "timeStamp");
            v29 = v28;
            objc_msgSend(v19, "force");
            v31 = v30;
            objc_msgSend(v19, "radius");
            v33 = -[TIContinuousPathSample initWithPoint:timeStamp:force:radius:stage:pathIndex:](v27, "initWithPoint:timeStamp:force:radius:stage:pathIndex:", objc_msgSend(v19, "stage"), objc_msgSend(v19, "pathIndex"), v23 + v21 * v22, v26 + v25 * v41, v29, v31, v32);
            -[TIContinuousPath addSample:](v14, "addSample:", v33);

          }
          v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v42, v47, 16);
        }
        while (v16);
      }

    }
    else
    {
      v14 = v40;
    }

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_translatedKBDLayouts, 0);
  objc_storeStrong((id *)&self->_lookupTree, 0);
  objc_storeStrong((id *)&self->_transforms, 0);
  objc_storeStrong((id *)&self->_pathFile, 0);
  objc_storeStrong((id *)&self->_source, 0);
}

void __61__UserPathManager_translateLayoutForKeys_keyboardController___block_invoke(uint64_t a1, void *a2)
{
  id v4;
  uint64_t v5;
  id *v6;
  uint64_t v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  _BOOL4 IsNull;
  uint64_t v17;
  id v18;
  CGRect v19;

  v4 = a2;
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v7 = *(_QWORD *)(v5 + 40);
  v6 = (id *)(v5 + 40);
  v18 = v4;
  if (!v7)
  {
    objc_storeStrong(v6, a2);
    v4 = v18;
  }
  objc_msgSend(v4, "frame");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  IsNull = CGRectIsNull(*(CGRect *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 48));
  v17 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  if (IsNull)
  {
    *(CGFloat *)(v17 + 48) = v9;
    *(CGFloat *)(v17 + 56) = v11;
    *(CGFloat *)(v17 + 64) = v13;
    *(CGFloat *)(v17 + 72) = v15;
  }
  else
  {
    v19.origin.x = v9;
    v19.origin.y = v11;
    v19.size.width = v13;
    v19.size.height = v15;
    *(CGRect *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 48) = CGRectUnion(*(CGRect *)(v17 + 48), v19);
  }

}

@end
