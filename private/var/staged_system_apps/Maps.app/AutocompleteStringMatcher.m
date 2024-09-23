@implementation AutocompleteStringMatcher

- (AutocompleteStringMatcher)init
{
  -[AutocompleteStringMatcher doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (AutocompleteStringMatcher)initWithString:(id)a3 requiredMatchLength:(unint64_t)a4 matchInfo:(id)a5
{
  id v9;
  id v10;
  AutocompleteStringMatcher *v11;
  AutocompleteStringMatcher *v12;
  objc_super v14;

  v9 = a3;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)AutocompleteStringMatcher;
  v11 = -[AutocompleteStringMatcher init](&v14, "init");
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_string, a3);
    v12->_requiredMatchLength = a4;
    objc_storeStrong((id *)&v12->_matchInfo, a5);
  }

  return v12;
}

- (AutocompleteStringMatcher)initWithPlaceName:(id)a3 matchInfo:(id)a4
{
  return -[AutocompleteStringMatcher initWithString:requiredMatchLength:matchInfo:](self, "initWithString:requiredMatchLength:matchInfo:", a3, 1, a4);
}

- (AutocompleteStringMatcher)initWithPlaceAddress:(id)a3 matchInfo:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  AutocompleteStringMatcher *v9;

  v6 = a4;
  v7 = a3;
  if (objc_msgSend(v7, "_navigation_isCJK"))
    v8 = 1;
  else
    v8 = 3;
  v9 = -[AutocompleteStringMatcher initWithString:requiredMatchLength:matchInfo:](self, "initWithString:requiredMatchLength:matchInfo:", v7, v8, v6);

  return v9;
}

- (id)matchForAutocompleteSearchString:(id)a3
{
  id v4;
  unsigned __int8 v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  char v12;
  uint64_t v13;
  void *i;
  uint64_t v15;
  void *v16;
  id v17;
  double v18;
  id v20;
  AutocompleteStringMatcher *v21;
  id obj;
  _QWORD v23[9];
  char v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  char v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint64_t v37;
  double *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  uint64_t v44;
  _BYTE v45[128];

  v4 = a3;
  if (-[NSString length](self->_string, "length") && objc_msgSend(v4, "length"))
  {
    v5 = objc_msgSend(v4, "_navigation_isCJK");
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet whitespaceAndNewlineCharacterSet](NSCharacterSet, "whitespaceAndNewlineCharacterSet"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringByTrimmingCharactersInSet:", v6));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "componentsSeparatedByCharactersInSet:", v6));

    if (objc_msgSend(v8, "count"))
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSString componentsSeparatedByCharactersInSet:](self->_string, "componentsSeparatedByCharactersInSet:", v6));
      v21 = self;
      v10 = objc_msgSend(v9, "mutableCopy");

      v20 = objc_msgSend(v10, "count");
      v41 = 0;
      v42 = &v41;
      v43 = 0x2020000000;
      v44 = 0;
      v37 = 0;
      v38 = (double *)&v37;
      v39 = 0x2020000000;
      v40 = 0;
      v33 = 0u;
      v34 = 0u;
      v35 = 0u;
      v36 = 0u;
      obj = v8;
      v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v45, 16);
      if (v11)
      {
        v12 = v5 ^ 1;
        v13 = *(_QWORD *)v34;
        while (2)
        {
          for (i = 0; i != v11; i = (char *)i + 1)
          {
            if (*(_QWORD *)v34 != v13)
              objc_enumerationMutation(obj);
            v15 = *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * (_QWORD)i);
            v29 = 0;
            v30 = &v29;
            v31 = 0x2020000000;
            v32 = 0;
            v25 = 0;
            v26 = &v25;
            v27 = 0x2020000000;
            v28 = 0x7FFFFFFFFFFFFFFFLL;
            v23[0] = _NSConcreteStackBlock;
            v23[1] = 3221225472;
            v23[2] = sub_10056FE9C;
            v23[3] = &unk_1011BB658;
            v24 = v12;
            v23[4] = v15;
            v23[5] = &v29;
            v23[6] = &v41;
            v23[7] = &v25;
            v23[8] = &v37;
            objc_msgSend(v10, "enumerateObjectsUsingBlock:", v23, v20);
            if (!*((_BYTE *)v30 + 24))
            {
              _Block_object_dispose(&v25, 8);
              _Block_object_dispose(&v29, 8);

              goto LABEL_17;
            }
            objc_msgSend(v10, "removeObjectsInRange:", 0, v26[3] + 1);
            _Block_object_dispose(&v25, 8);
            _Block_object_dispose(&v29, 8);
          }
          v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v45, 16);
          if (v11)
            continue;
          break;
        }
      }

      if (v42[3] < v21->_requiredMatchLength)
      {
LABEL_17:
        v17 = 0;
      }
      else
      {
        v16 = (void *)objc_claimAutoreleasedReturnValue(-[AutocompleteStringMatcher matchInfo](v21, "matchInfo"));
        v17 = objc_msgSend(v16, "copy");

        if (v20)
        {
          v18 = v38[3] / (double)(unint64_t)v20;
          v38[3] = v18;
        }
        else
        {
          v18 = v38[3];
        }
        objc_msgSend(v17, "setFractionOfMatch:", v18, v20);
      }
      _Block_object_dispose(&v37, 8);
      _Block_object_dispose(&v41, 8);

    }
    else
    {
      v17 = 0;
    }

  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (AutocompleteMatchInfo)matchInfo
{
  return self->_matchInfo;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_matchInfo, 0);
  objc_storeStrong((id *)&self->_string, 0);
}

@end
