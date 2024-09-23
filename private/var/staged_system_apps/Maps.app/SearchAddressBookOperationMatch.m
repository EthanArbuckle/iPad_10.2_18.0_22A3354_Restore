@implementation SearchAddressBookOperationMatch

- (SearchAddressBookOperationMatch)init
{
  -[SearchAddressBookOperationMatch doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (SearchAddressBookOperationMatch)initWithContact:(id)a3 context:(id)a4
{
  id v7;
  id v8;
  SearchAddressBookOperationMatch *v9;
  SearchAddressBookOperationMatch *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  id v33;
  id v34;
  _QWORD *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  AutocompleteQueryStringMatch *stringMatch;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  uint64_t v44;
  AutocompleteQueryStringMatch *v45;
  void *v46;
  uint64_t v47;
  AutocompleteQueryStringMatch *v48;
  AutocompleteQueryStringMatch *v49;
  void *v50;
  void *v51;
  uint64_t v52;
  AutocompleteQueryStringMatch *v53;
  void *v55;
  id v56;
  _QWORD v57[4];
  id v58;
  id v59;
  _QWORD v60[4];
  id v61;
  objc_super v62;

  v7 = a3;
  v8 = a4;
  v62.receiver = self;
  v62.super_class = (Class)SearchAddressBookOperationMatch;
  v9 = -[SearchAddressBookOperationMatch init](&v62, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_contact, a3);
    v10->_peopleSuggesterRank = 0.0;
    v10->_isCJK = objc_msgSend(v8, "isCJK");
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "postalAddresses"));
    v10->_hasAddress = objc_msgSend(v11, "count") != 0;

    if (v10->_hasAddress)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet whitespaceAndNewlineCharacterSet](NSCharacterSet, "whitespaceAndNewlineCharacterSet"));
      v55 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
      v60[0] = _NSConcreteStackBlock;
      v60[1] = 3221225472;
      v60[2] = sub_10098463C;
      v60[3] = &unk_1011DD410;
      v56 = v12;
      v61 = v56;
      v14 = objc_retainBlock(v60);
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "namePrefix"));
      v16 = ((uint64_t (*)(_QWORD *, void *))v14[2])(v14, v15);
      v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
      objc_msgSend(v13, "setObject:forKeyedSubscript:", v17, CFSTR("namePrefix"));

      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "nickname"));
      v19 = ((uint64_t (*)(_QWORD *, void *))v14[2])(v14, v18);
      v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
      objc_msgSend(v13, "setObject:forKeyedSubscript:", v20, CFSTR("nickname"));

      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "givenName"));
      v22 = ((uint64_t (*)(_QWORD *, void *))v14[2])(v14, v21);
      v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
      objc_msgSend(v13, "setObject:forKeyedSubscript:", v23, CFSTR("givenName"));

      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "middleName"));
      v25 = ((uint64_t (*)(_QWORD *, void *))v14[2])(v14, v24);
      v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
      objc_msgSend(v13, "setObject:forKeyedSubscript:", v26, CFSTR("middleName"));

      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "familyName"));
      v28 = ((uint64_t (*)(_QWORD *, void *))v14[2])(v14, v27);
      v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
      objc_msgSend(v13, "setObject:forKeyedSubscript:", v29, CFSTR("familyName"));

      v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "nameSuffix"));
      v31 = ((uint64_t (*)(_QWORD *, void *))v14[2])(v14, v30);
      v32 = (void *)objc_claimAutoreleasedReturnValue(v31);
      objc_msgSend(v13, "setObject:forKeyedSubscript:", v32, CFSTR("nameSuffix"));

      v57[0] = _NSConcreteStackBlock;
      v57[1] = 3221225472;
      v57[2] = sub_1009847CC;
      v57[3] = &unk_1011B5288;
      v33 = v13;
      v58 = v33;
      v34 = v55;
      v59 = v34;
      v35 = objc_retainBlock(v57);
      ((void (*)(_QWORD *, const __CFString *))v35[2])(v35, CFSTR("namePrefix"));
      ((void (*)(_QWORD *, const __CFString *))v35[2])(v35, CFSTR("nickname"));
      ((void (*)(_QWORD *, const __CFString *))v35[2])(v35, CFSTR("givenName"));
      ((void (*)(_QWORD *, const __CFString *))v35[2])(v35, CFSTR("middleName"));
      ((void (*)(_QWORD *, const __CFString *))v35[2])(v35, CFSTR("familyName"));
      ((void (*)(_QWORD *, const __CFString *))v35[2])(v35, CFSTR("nameSuffix"));
      v36 = (void *)objc_claimAutoreleasedReturnValue(+[CNContactFormatter stringFromContact:style:](CNContactFormatter, "stringFromContact:style:", v7, 0));
      if (objc_msgSend(v34, "count"))
      {
        v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "query"));
        v38 = objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "matchesInStringTerms:displayString:", v34, v36));
        stringMatch = v10->_stringMatch;
        v10->_stringMatch = (AutocompleteQueryStringMatch *)v38;

        if (v10->_stringMatch)
        {
          v10->_isNameMatch = 1;
        }
        else
        {
          objc_msgSend(v34, "removeAllObjects");
          ((void (*)(_QWORD *, const __CFString *))v35[2])(v35, CFSTR("namePrefix"));
          ((void (*)(_QWORD *, const __CFString *))v35[2])(v35, CFSTR("familyName"));
          ((void (*)(_QWORD *, const __CFString *))v35[2])(v35, CFSTR("nickname"));
          ((void (*)(_QWORD *, const __CFString *))v35[2])(v35, CFSTR("givenName"));
          ((void (*)(_QWORD *, const __CFString *))v35[2])(v35, CFSTR("middleName"));
          ((void (*)(_QWORD *, const __CFString *))v35[2])(v35, CFSTR("nameSuffix"));
          v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "query"));
          v47 = objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "matchesInStringTerms:displayString:", v34, v36));
          v48 = v10->_stringMatch;
          v10->_stringMatch = (AutocompleteQueryStringMatch *)v47;

          v49 = v10->_stringMatch;
          v10->_isNameMatch = v49 != 0;
          if (!v49 && v10->_isCJK)
          {
            v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "componentsJoinedByString:", &stru_1011EB268));
            v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "query"));
            v52 = objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "matchesInString:", v50));
            v53 = v10->_stringMatch;
            v10->_stringMatch = (AutocompleteQueryStringMatch *)v52;

            v10->_isNameMatch = v10->_stringMatch != 0;
          }
        }
      }
      else
      {
        v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "organizationName"));
        v41 = ((uint64_t (*)(_QWORD *, void *))v14[2])(v14, v40);
        v42 = (void *)objc_claimAutoreleasedReturnValue(v41);

        v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "query"));
        v44 = objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "matchesInStringTerms:displayString:", v42, v36));
        v45 = v10->_stringMatch;
        v10->_stringMatch = (AutocompleteQueryStringMatch *)v44;

        v10->_isOrganizationMatch = v10->_stringMatch != 0;
      }

    }
  }

  return v10;
}

- (double)fractionOfMatch
{
  double result;

  -[AutocompleteQueryStringMatch fractionOfMatch](self->_stringMatch, "fractionOfMatch");
  return result;
}

- (int64_t)compare:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  uint64_t v8;
  uint64_t v9;
  int64_t v10;
  void *v11;
  void *v12;

  v4 = a3;
  -[SearchAddressBookOperationMatch peopleSuggesterRank](self, "peopleSuggesterRank");
  v6 = v5;
  objc_msgSend(v4, "peopleSuggesterRank");
  if (v6 == v7)
  {
    -[SearchAddressBookOperationMatch fractionOfMatch](self, "fractionOfMatch");
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
    objc_msgSend(v4, "fractionOfMatch");
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
    v10 = (int64_t)objc_msgSend(v12, "compare:", v11);

  }
  else
  {
    v8 = -1;
    if (v6 >= v7)
      v9 = 1;
    else
      v9 = -1;
    if (v7 != 0.0)
      v8 = v9;
    if (v6 == 0.0)
      v10 = 1;
    else
      v10 = v8;
  }

  return v10;
}

- (BOOL)isGoodMatch
{
  return self->_hasAddress && self->_stringMatch != 0;
}

- (BOOL)isNameMatch
{
  return self->_isNameMatch;
}

- (BOOL)isOrganizationMatch
{
  return self->_isOrganizationMatch;
}

- (AutocompleteMatchInfo)autocompleteMatchInfo
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  if (-[SearchAddressBookOperationMatch isGoodMatch](self, "isGoodMatch"))
  {
    if (self->_isNameMatch)
      v3 = 1;
    else
      v3 = 2 * self->_isOrganizationMatch;
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[AutocompleteMatchInfo matchInfoWithType:](AutocompleteMatchInfo, "matchInfoWithType:", v3));
    -[SearchAddressBookOperationMatch peopleSuggesterRank](self, "peopleSuggesterRank");
    objc_msgSend(v4, "setPeopleSuggesterRank:");
    -[SearchAddressBookOperationMatch fractionOfMatch](self, "fractionOfMatch");
    objc_msgSend(v4, "setFractionOfMatch:");
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[AutocompleteQueryStringMatch prefixLastTokenMatchCover](self->_stringMatch, "prefixLastTokenMatchCover"));
    objc_msgSend(v4, "setPrefixLastTokenMatchCover:", v5);

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[AutocompleteQueryStringMatch prefixMatchCover](self->_stringMatch, "prefixMatchCover"));
    objc_msgSend(v4, "setPrefixMatchCover:", v6);

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[AutocompleteQueryStringMatch prefixMatchPosition](self->_stringMatch, "prefixMatchPosition"));
    objc_msgSend(v4, "setPrefixMatchPosition:", v7);

    objc_msgSend(v4, "setPrefixMatchesWordBoundary:", -[AutocompleteQueryStringMatch prefixMatchesWordBoundary](self->_stringMatch, "prefixMatchesWordBoundary"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[AutocompleteQueryStringMatch firstPrefixToken](self->_stringMatch, "firstPrefixToken"));
    objc_msgSend(v4, "setFirstPrefixToken:", v8);

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[AutocompleteQueryStringMatch secondPrefixToken](self->_stringMatch, "secondPrefixToken"));
    objc_msgSend(v4, "setSecondPrefixToken:", v9);

  }
  else
  {
    v4 = 0;
  }
  return (AutocompleteMatchInfo *)v4;
}

- (CNContact)contact
{
  return self->_contact;
}

- (double)peopleSuggesterRank
{
  return self->_peopleSuggesterRank;
}

- (void)setPeopleSuggesterRank:(double)a3
{
  self->_peopleSuggesterRank = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contact, 0);
  objc_storeStrong((id *)&self->_stringMatch, 0);
}

@end
