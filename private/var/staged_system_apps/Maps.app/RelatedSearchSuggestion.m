@implementation RelatedSearchSuggestion

- (RelatedSearchSuggestion)initWithResultDisplayHeader:(id)a3 substitutes:(id)a4 visibleTime:(double)a5 showCloseButton:(BOOL)a6
{
  id v10;
  id v11;
  RelatedSearchSuggestion *v12;
  NSString *v13;
  NSString *resultDisplayHeader;
  objc_super v16;

  v10 = a3;
  v11 = a4;
  v16.receiver = self;
  v16.super_class = (Class)RelatedSearchSuggestion;
  v12 = -[RelatedSearchSuggestion init](&v16, "init");
  if (v12)
  {
    v13 = (NSString *)objc_msgSend(v10, "copy");
    resultDisplayHeader = v12->_resultDisplayHeader;
    v12->_resultDisplayHeader = v13;

    objc_storeStrong((id *)&v12->_pdSubstitutes, a4);
    v12->_visibleTime = a5;
    v12->_showCloseButton = a6;
    -[RelatedSearchSuggestion _parseSubtitutes](v12, "_parseSubtitutes");
    -[RelatedSearchSuggestion _parseComponents](v12, "_parseComponents");
  }

  return v12;
}

- (void)_parseSubtitutes
{
  char *v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  unint64_t v7;
  char *v8;
  unsigned __int8 v9;
  RelatedSearchSuggestionSubstitute *v10;
  void *v11;
  RelatedSearchSuggestionSubstitute *v12;
  NSString *resultDisplayHeader;
  void *v14;
  NSString *v15;
  NSString *v16;
  uint64_t v17;
  uint64_t v18;
  NSArray *v19;
  NSArray *substitutes;
  id v21;

  v21 = objc_alloc_init((Class)NSMutableArray);
  v3 = (char *)-[NSString rangeOfString:](self->_resultDisplayHeader, "rangeOfString:", CFSTR("%s"));
  if (v3 != (char *)0x7FFFFFFFFFFFFFFFLL)
  {
    v5 = v3;
    v6 = v4;
    v7 = 0;
    v8 = 0;
    do
    {
      if (v7 >= -[NSArray count](self->_pdSubstitutes, "count"))
        break;
      v9 = -[NSString maps_isSubstringStartingAtRangeEscaped:](self->_resultDisplayHeader, "maps_isSubstringStartingAtRangeEscaped:", v5, v6);
      if (v5 > v8 && (v9 & 1) == 0)
      {
        v10 = [RelatedSearchSuggestionSubstitute alloc];
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](self->_pdSubstitutes, "objectAtIndexedSubscript:", v7));
        v12 = -[RelatedSearchSuggestionSubstitute initWithLocation:substitute:](v10, "initWithLocation:substitute:", v5, v11);

        objc_msgSend(v21, "addObject:", v12);
        resultDisplayHeader = self->_resultDisplayHeader;
        v14 = (void *)objc_claimAutoreleasedReturnValue(-[RelatedSearchSuggestionSubstitute substituteText](v12, "substituteText"));
        v15 = (NSString *)objc_claimAutoreleasedReturnValue(-[NSString stringByReplacingCharactersInRange:withString:](resultDisplayHeader, "stringByReplacingCharactersInRange:withString:", v5, v6, v14));
        v16 = self->_resultDisplayHeader;
        self->_resultDisplayHeader = v15;

        v5 = (char *)-[RelatedSearchSuggestionSubstitute range](v12, "range");
        v6 = v17;

      }
      v8 = &v5[v6];
      v5 = (char *)-[NSString rangeOfString:](self->_resultDisplayHeader, "rangeOfString:", CFSTR("%s"));
      v6 = v18;
      ++v7;
    }
    while (v5 != (char *)0x7FFFFFFFFFFFFFFFLL);
  }
  v19 = (NSArray *)objc_msgSend(v21, "copy");
  substitutes = self->_substitutes;
  self->_substitutes = v19;

}

- (NSString)displayString
{
  id v3;
  NSArray *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v3 = objc_alloc_init((Class)NSMutableString);
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = self->_components;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)v8), "displayText", (_QWORD)v12));
        objc_msgSend(v3, "appendString:", v9);

        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

  v10 = objc_msgSend(v3, "copy");
  return (NSString *)v10;
}

- (void)_parseComponents
{
  id v3;
  NSArray *v4;
  NSArray *v5;
  _QWORD *v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  unint64_t v10;
  unsigned __int8 v11;
  char v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  unint64_t v16;
  unsigned __int8 v17;
  char *v18;
  char v19;
  void *v20;
  char *v21;
  void *v22;
  NSString *v23;
  NSString *resultDisplayHeader;
  uint64_t v25;
  unint64_t v26;
  NSUInteger v27;
  uint64_t v28;
  NSUInteger v29;
  void *v30;
  NSArray *v31;
  NSArray *components;
  id v33;
  _QWORD v34[4];
  NSArray *v35;
  id v36;
  uint64_t *v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t *v44;
  uint64_t v45;
  uint64_t v46;

  v3 = objc_alloc_init((Class)NSMutableArray);
  v43 = 0;
  v44 = &v43;
  v45 = 0x2020000000;
  v46 = 0;
  v39 = 0;
  v40 = &v39;
  v41 = 0x2020000000;
  v42 = 0;
  v4 = self->_substitutes;
  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472;
  v34[2] = sub_1009B4800;
  v34[3] = &unk_1011DDC60;
  v37 = &v43;
  v5 = v4;
  v35 = v5;
  v33 = v3;
  v36 = v33;
  v38 = &v39;
  v6 = objc_retainBlock(v34);
  v8 = (char *)-[NSString rangeOfString:](self->_resultDisplayHeader, "rangeOfString:", CFSTR("["));
  if (v8 != (char *)0x7FFFFFFFFFFFFFFFLL)
  {
    v9 = v7;
    do
    {
      v10 = v44[3];
      if (v10 >= -[NSArray count](v5, "count"))
        break;
      v11 = -[NSString maps_isSubstringStartingAtRangeEscaped:](self->_resultDisplayHeader, "maps_isSubstringStartingAtRangeEscaped:", v8, v9);
      if ((unint64_t)v8 <= v40[3])
        v12 = 1;
      else
        v12 = v11;
      if ((v12 & 1) == 0)
      {
        v14 = (char *)-[NSString rangeOfString:](self->_resultDisplayHeader, "rangeOfString:", CFSTR("]"));
        if (v14 != (char *)0x7FFFFFFFFFFFFFFFLL)
        {
          v15 = v13;
          while (1)
          {
            v16 = v44[3];
            if (v16 >= -[NSArray count](v5, "count"))
              break;
            v17 = -[NSString maps_isSubstringStartingAtRangeEscaped:](self->_resultDisplayHeader, "maps_isSubstringStartingAtRangeEscaped:", v14, v15);
            v18 = (char *)v40[3];
            if (v14 <= v18)
              v19 = 1;
            else
              v19 = v17;
            if ((v19 & 1) == 0)
            {
              if (v8 > v18)
              {
                v20 = (void *)objc_claimAutoreleasedReturnValue(-[NSString substringWithRange:](self->_resultDisplayHeader, "substringWithRange:", v40[3], v8 - v18));
                ((void (*)(_QWORD *, void *, char *, int64_t))v6[2])(v6, v20, v18, v8 - v18);

                v18 = (char *)v40[3];
              }
              if (v18 == v8)
              {
                v21 = &v14[v15 - (_QWORD)v8];
                v22 = (void *)objc_claimAutoreleasedReturnValue(-[NSString substringWithRange:](self->_resultDisplayHeader, "substringWithRange:", v8 + 1, v21 - 2));
                ((void (*)(_QWORD *, void *, char *, char *))v6[2])(v6, v22, v8 + 1, v21 - 2);
                v23 = (NSString *)objc_claimAutoreleasedReturnValue(-[NSString stringByReplacingCharactersInRange:withString:](self->_resultDisplayHeader, "stringByReplacingCharactersInRange:withString:", v8, v21, v22));
                resultDisplayHeader = self->_resultDisplayHeader;
                self->_resultDisplayHeader = v23;

              }
              v8 = (char *)-[NSString rangeOfString:](self->_resultDisplayHeader, "rangeOfString:", CFSTR("["));
              v9 = v25;
              break;
            }
          }
        }
      }
    }
    while (v8 != (char *)0x7FFFFFFFFFFFFFFFLL);
  }
  v26 = v40[3];
  if (v26 < -[NSString length](self->_resultDisplayHeader, "length"))
  {
    v27 = -[NSString length](self->_resultDisplayHeader, "length");
    v28 = v40[3];
    v29 = v27 - v28;
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[NSString substringWithRange:](self->_resultDisplayHeader, "substringWithRange:", v28, v27 - v28));
    ((void (*)(_QWORD *, void *, uint64_t, NSUInteger))v6[2])(v6, v30, v28, v29);

  }
  v31 = (NSArray *)objc_msgSend(v33, "copy");
  components = self->_components;
  self->_components = v31;

  _Block_object_dispose(&v39, 8);
  _Block_object_dispose(&v43, 8);

}

- (NSArray)components
{
  return self->_components;
}

- (void)setComponents:(id)a3
{
  objc_storeStrong((id *)&self->_components, a3);
}

- (double)visibleTime
{
  return self->_visibleTime;
}

- (BOOL)showCloseButton
{
  return self->_showCloseButton;
}

- (NSString)resultDisplayHeader
{
  return self->_resultDisplayHeader;
}

- (void)setResultDisplayHeader:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSArray)substitutes
{
  return self->_substitutes;
}

- (void)setSubstitutes:(id)a3
{
  objc_storeStrong((id *)&self->_substitutes, a3);
}

- (NSArray)pdSubstitutes
{
  return self->_pdSubstitutes;
}

- (void)setPdSubstitutes:(id)a3
{
  objc_storeStrong((id *)&self->_pdSubstitutes, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pdSubstitutes, 0);
  objc_storeStrong((id *)&self->_substitutes, 0);
  objc_storeStrong((id *)&self->_resultDisplayHeader, 0);
  objc_storeStrong((id *)&self->_components, 0);
}

@end
