@implementation BKEventStatistic

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_associatedStatistics, 0);
  objc_storeStrong((id *)&self->_label, 0);
}

- (BOOL)needsLogging
{
  return self->_needsLogging;
}

- (NSString)label
{
  return self->_label;
}

- (void)appendDescriptionToFormatter:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;

  v11 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray bs_filter:](self->_associatedStatistics, "bs_filter:", &stru_1000EBE18));
  if (objc_msgSend(v4, "count"))
  {
    v6 = objc_opt_class(BSDescriptionStream, v5);
    v7 = v11;
    v8 = v7;
    if (v6)
    {
      if ((objc_opt_isKindOfClass(v7, v6) & 1) != 0)
        v9 = v8;
      else
        v9 = 0;
    }
    else
    {
      v9 = 0;
    }
    v10 = v9;

    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100074688;
    v12[3] = &unk_1000EBE40;
    v13 = v8;
    objc_msgSend(v10, "appendCollection:withName:itemBlock:", v4, 0, v12);

  }
}

+ (BKEventStatistic)statisticWithLabel:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;

  v4 = a3;
  v6 = objc_alloc_init((Class)objc_opt_class(a1, v5));
  objc_msgSend(v6, "setLabel:", v4);

  return (BKEventStatistic *)v6;
}

- (void)setLabel:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void)setAutomaticResetDisabled:(BOOL)a3
{
  self->_automaticResetDisabled = a3;
}

- (void)setNeedsLogging:(BOOL)a3
{
  self->_needsLogging = a3;
}

- (BOOL)automaticResetDisabled
{
  return self->_automaticResetDisabled;
}

- (void)reset
{
  NSArray *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];

  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v3 = self->_associatedStatistics;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * (_QWORD)v7), "reset", (_QWORD)v8);
        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      v5 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

  self->_needsLogging = 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  uint64_t v5;

  v4 = objc_msgSend((id)objc_opt_class(self, a2), "statisticWithLabel:", self->_label);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  objc_storeStrong((id *)(v5 + 24), self->_associatedStatistics);
  *(_BYTE *)(v5 + 9) = self->_needsLogging;
  return (id)v5;
}

- (NSArray)associatedStatistics
{
  return self->_associatedStatistics;
}

- (void)setAssociatedStatistics:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

@end
