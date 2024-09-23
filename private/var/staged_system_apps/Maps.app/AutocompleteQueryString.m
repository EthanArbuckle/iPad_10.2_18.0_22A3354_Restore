@implementation AutocompleteQueryString

- (AutocompleteQueryString)init
{
  -[AutocompleteQueryString doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (AutocompleteQueryString)initWithQuery:(id)a3
{
  return -[AutocompleteQueryString initWithQuery:requiredMatchLength:](self, "initWithQuery:requiredMatchLength:", a3, 1);
}

- (AutocompleteQueryString)initWithQuery:(id)a3 requiredMatchLength:(unint64_t)a4
{
  id v7;
  AutocompleteQueryString *v8;
  id v9;
  void *v10;
  uint64_t v11;
  NSString *query;
  NSString *v13;
  id v14;
  void *v15;
  uint64_t v16;
  NSArray *queryTerms;
  objc_super v19;

  v7 = a3;
  v19.receiver = self;
  v19.super_class = (Class)AutocompleteQueryString;
  v8 = -[AutocompleteQueryString init](&v19, "init");
  if (v8)
  {
    v9 = sub_1004BDD24();
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "stringByTrimmingCharactersInSet:", v10));
    query = v8->_query;
    v8->_query = (NSString *)v11;

    objc_storeStrong((id *)&v8->_unsanitazedQuery, a3);
    v8->_isCJK = -[NSString _navigation_isCJK](v8->_query, "_navigation_isCJK");
    v8->_requiredMatchLength = a4;
    v13 = v8->_query;
    v14 = sub_1004BDD24();
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    v16 = objc_claimAutoreleasedReturnValue(-[NSString componentsSeparatedByCharactersInSet:](v13, "componentsSeparatedByCharactersInSet:", v15));
    queryTerms = v8->_queryTerms;
    v8->_queryTerms = (NSArray *)v16;

  }
  return v8;
}

- (BOOL)matchesString:(id)a3
{
  void *v4;
  void *v5;
  BOOL v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[AutocompleteQueryString matchesInString:](self, "matchesInString:", a3));
  v5 = v4;
  if (v4)
    v6 = (unint64_t)objc_msgSend(v4, "totalMatchLength") >= self->_requiredMatchLength;
  else
    v6 = 0;

  return v6;
}

- (id)matchesInString:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = a3;
  if (objc_msgSend(v4, "length")
    && -[NSString length](self->_query, "length")
    && -[NSArray count](self->_queryTerms, "count"))
  {
    v5 = sub_1004BDD24();
    v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringByTrimmingCharactersInSet:", v6));

    v8 = sub_1004BDD24();
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "componentsSeparatedByCharactersInSet:", v9));

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[AutocompleteQueryString matchesInStringTerms:displayString:](self, "matchesInStringTerms:displayString:", v10, v4));
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)matchesInStringTerms:(id)a3 displayString:(id)a4
{
  id v6;
  id v7;
  BOOL isCJK;
  NSArray *v9;
  id v10;
  BOOL v11;
  uint64_t v12;
  void *i;
  uint64_t v14;
  int v15;
  NSArray *v16;
  id v17;
  double v18;
  void *v19;
  AutocompleteQueryStringMatch *v20;
  unint64_t v21;
  double v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  AutocompleteQueryString *v33;
  BOOL v34;
  void *v35;
  id v36;
  void *v37;
  id v38;
  AutocompleteQueryStringMatch *v39;
  uint64_t v41;
  AutocompleteQueryString *v42;
  NSArray *obj;
  void *v44;
  void *v45;
  id v46;
  id v47;
  _QWORD v48[5];
  id v49;
  id v50;
  id v51;
  uint64_t *v52;
  uint64_t *v53;
  uint64_t *v54;
  uint64_t *v55;
  uint64_t *v56;
  uint64_t *v57;
  uint64_t *v58;
  BOOL v59;
  uint64_t v60;
  uint64_t *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t *v65;
  uint64_t v66;
  char v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  uint64_t v72;
  double *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t *v81;
  uint64_t v82;
  uint64_t (*v83)(uint64_t, uint64_t);
  void (*v84)(uint64_t);
  id v85;
  uint64_t v86;
  uint64_t *v87;
  uint64_t v88;
  uint64_t (*v89)(uint64_t, uint64_t);
  void (*v90)(uint64_t);
  id v91;
  uint64_t v92;
  uint64_t *v93;
  uint64_t v94;
  uint64_t (*v95)(uint64_t, uint64_t);
  void (*v96)(uint64_t);
  id v97;
  _BYTE v98[128];

  v6 = a3;
  v46 = a4;
  v44 = v6;
  v91 = 0;
  v92 = 0;
  v93 = &v92;
  v94 = 0x3032000000;
  v95 = sub_1004BE4E0;
  v96 = sub_1004BE4F0;
  v97 = 0;
  v86 = 0;
  v87 = &v86;
  v88 = 0x3032000000;
  v89 = sub_1004BE4E0;
  v90 = sub_1004BE4F0;
  v80 = 0;
  v81 = &v80;
  v82 = 0x3032000000;
  v83 = sub_1004BE4E0;
  v84 = sub_1004BE4F0;
  v85 = 0;
  v47 = objc_msgSend(v6, "mutableCopy");
  v7 = objc_msgSend(v47, "count");
  isCJK = self->_isCJK;
  v76 = 0;
  v77 = &v76;
  v78 = 0x2020000000;
  v79 = 0;
  v72 = 0;
  v73 = (double *)&v72;
  v74 = 0x2020000000;
  v75 = 0;
  v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v42 = self;
  v70 = 0u;
  v71 = 0u;
  v68 = 0u;
  v69 = 0u;
  v9 = self->_queryTerms;
  v10 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v68, v98, 16);
  if (v10)
  {
    v11 = !isCJK;
    v12 = *(_QWORD *)v69;
    obj = v9;
    while (2)
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(_QWORD *)v69 != v12)
          objc_enumerationMutation(obj);
        v14 = *(_QWORD *)(*((_QWORD *)&v68 + 1) + 8 * (_QWORD)i);
        v64 = 0;
        v65 = &v64;
        v66 = 0x2020000000;
        v67 = 0;
        v60 = 0;
        v61 = &v60;
        v62 = 0x2020000000;
        v63 = 0x7FFFFFFFFFFFFFFFLL;
        v48[0] = _NSConcreteStackBlock;
        v48[1] = 3221225472;
        v48[2] = sub_1004BE4F8;
        v48[3] = &unk_1011B8CB8;
        v59 = v11;
        v48[4] = v14;
        v52 = &v64;
        v53 = &v76;
        v49 = v45;
        v54 = &v60;
        v55 = &v80;
        v56 = &v72;
        v50 = v46;
        v51 = v44;
        v57 = &v92;
        v58 = &v86;
        objc_msgSend(v47, "enumerateObjectsUsingBlock:", v48);
        v15 = *((unsigned __int8 *)v65 + 24);
        if (!*((_BYTE *)v65 + 24))
        {

          _Block_object_dispose(&v60, 8);
          _Block_object_dispose(&v64, 8);
LABEL_15:
          v20 = 0;
          goto LABEL_27;
        }
        objc_msgSend(v47, "removeObjectsInRange:", 0, v61[3] + 1);

        _Block_object_dispose(&v60, 8);
        _Block_object_dispose(&v64, 8);
        if (!v15)
          goto LABEL_15;
      }
      v9 = obj;
      v10 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v68, v98, 16);
      if (v10)
        continue;
      break;
    }
  }

  if (v7)
    v73[3] = v73[3] / (double)(unint64_t)v7;
  v16 = (NSArray *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "lastObject"));
  if (-[NSArray length](v16, "length"))
  {
    v17 = objc_msgSend((id)v81[5], "length");
    *(float *)&v18 = (float)(unint64_t)v17 / (float)(unint64_t)-[NSArray length](v16, "length");
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v18));
  }
  else
  {
    v19 = 0;
  }
  v21 = -[NSString length](self->_unsanitazedQuery, "length");
  *(float *)&v22 = (float)v21 / (float)(unint64_t)objc_msgSend(v46, "length");
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v22));
  obj = v16;
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "uppercaseString"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[NSString uppercaseString](self->_unsanitazedQuery, "uppercaseString"));
  v26 = objc_msgSend(v24, "rangeOfString:", v25);

  if (v26 == (id)0x7FFFFFFFFFFFFFFFLL)
    v27 = 0;
  else
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v26));
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "uppercaseString"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[NSString uppercaseString](v42->_query, "uppercaseString"));
  v30 = (char *)objc_msgSend(v28, "rangeOfString:", v29);
  v32 = v31;

  v33 = v42;
  if (&v30[v32] <= objc_msgSend(v46, "length"))
  {
    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "substringFromIndex:"));
    if (objc_msgSend(v35, "length"))
    {
      v36 = sub_1004BDD24();
      v37 = (void *)objc_claimAutoreleasedReturnValue(v36);
      v38 = objc_msgSend(v35, "rangeOfCharacterFromSet:", v37);

      v34 = v38 == 0;
    }
    else
    {
      v34 = 1;
    }

    v33 = v42;
  }
  else
  {
    v34 = 0;
  }
  v39 = [AutocompleteQueryStringMatch alloc];
  LOBYTE(v41) = v34;
  v20 = -[AutocompleteQueryStringMatch initWithQueryTerms:stringTerms:matchingTerms:totalMatchLength:fractionOfMatch:prefixLastTokenMatchCover:prefixMatchCover:prefixMatchPosition:prefixMatchesWordBoundary:firstPrefixToken:secondPrefixToken:](v39, "initWithQueryTerms:stringTerms:matchingTerms:totalMatchLength:fractionOfMatch:prefixLastTokenMatchCover:prefixMatchCover:prefixMatchPosition:prefixMatchesWordBoundary:firstPrefixToken:secondPrefixToken:", v33->_queryTerms, v44, v45, v77[3], v19, v23, v73[3], v27, v41, v93[5], v87[5]);

LABEL_27:
  _Block_object_dispose(&v72, 8);
  _Block_object_dispose(&v76, 8);
  _Block_object_dispose(&v80, 8);

  _Block_object_dispose(&v86, 8);
  _Block_object_dispose(&v92, 8);

  return v20;
}

- (NSArray)queryTerms
{
  return self->_queryTerms;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queryTerms, 0);
  objc_storeStrong((id *)&self->_unsanitazedQuery, 0);
  objc_storeStrong((id *)&self->_query, 0);
}

@end
