@implementation FRFeedPickerSection

+ (id)feedPickerSectionWithTags:(id)a3 sorter:(id)a4 popularTagIDs:(id)a5 transformBlock:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  FRFeedPickerSection *v13;
  uint64_t v14;
  void *v15;

  v9 = a3;
  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = objc_alloc_init(FRFeedPickerSection);
  if (v9)
    v14 = objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithArray:](NSMutableSet, "setWithArray:", v9));
  else
    v14 = objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  v15 = (void *)v14;
  -[FRFeedPickerSection setMutableTags:](v13, "setMutableTags:", v14);

  -[FRFeedPickerSection setSorter:](v13, "setSorter:", v12);
  -[FRFeedPickerSection setPopularTagIDs:](v13, "setPopularTagIDs:", v11);

  -[FRFeedPickerSection setTransformBlock:](v13, "setTransformBlock:", v10);
  -[FRFeedPickerSection _buildSortedArrays](v13, "_buildSortedArrays");

  return v13;
}

- (NSArray)tags
{
  void *v2;
  id v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[FRFeedPickerSection mutableTags](self, "mutableTags"));
  v3 = objc_msgSend(v2, "copy");
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "allObjects"));

  return (NSArray *)v4;
}

- (void)addTag:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FRFeedPickerSection mutableTags](self, "mutableTags"));
  objc_msgSend(v5, "addObject:", v4);

  -[FRFeedPickerSection _buildSortedArrays](self, "_buildSortedArrays");
}

- (void)addTags:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FRFeedPickerSection mutableTags](self, "mutableTags"));
  objc_msgSend(v5, "addObjectsFromArray:", v4);

  -[FRFeedPickerSection _buildSortedArrays](self, "_buildSortedArrays");
}

- (void)removeTag:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FRFeedPickerSection mutableTags](self, "mutableTags"));
  objc_msgSend(v5, "removeObject:", v4);

  -[FRFeedPickerSection _buildSortedArrays](self, "_buildSortedArrays");
}

- (int64_t)indexOfTag:(id)a3 withSortOrder:(unint64_t)a4
{
  id v6;
  void *v7;
  id v8;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[FRFeedPickerSection _tagsForSortOrder:](self, "_tagsForSortOrder:", a4));
  v8 = objc_msgSend(v7, "indexOfObject:", v6);

  if (v8 == (id)0x7FFFFFFFFFFFFFFFLL && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    sub_10007C8F0();

  return (int64_t)v8;
}

- (BOOL)containsTag:(id)a3
{
  id v4;
  void *v5;
  unsigned __int8 v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FRFeedPickerSection tags](self, "tags"));
  v6 = objc_msgSend(v5, "containsObject:", v4);

  return v6;
}

- (int64_t)numberOfTags
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FRFeedPickerSection alphabeticalTags](self, "alphabeticalTags"));
  v4 = objc_msgSend(v3, "count");

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FRFeedPickerSection recentlyOpenedTags](self, "recentlyOpenedTags"));
  v6 = objc_msgSend(v5, "count");

  if (v4 != v6 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    sub_10007CA70();
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[FRFeedPickerSection mostFrequentlyVisitedTags](self, "mostFrequentlyVisitedTags"));
  v8 = objc_msgSend(v7, "count");

  if (v4 != v8 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    sub_10007C9B0();
  return (int64_t)v4;
}

- (id)feedDescriptorsForSort:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[FRFeedPickerSection _tagsForSortOrder:](self, "_tagsForSortOrder:", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FRFeedPickerSection transformBlock](self, "transformBlock"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "fc_arrayByTransformingWithBlock:", v5));

  return v6;
}

- (id)_tagsForSortOrder:(unint64_t)a3
{
  void *v3;

  if (a3 == 2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[FRFeedPickerSection mostFrequentlyVisitedTags](self, "mostFrequentlyVisitedTags"));
  }
  else if (a3 == 1)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[FRFeedPickerSection recentlyOpenedTags](self, "recentlyOpenedTags"));
  }
  else if (a3)
  {
    v3 = 0;
  }
  else
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[FRFeedPickerSection alphabeticalTags](self, "alphabeticalTags"));
  }
  return v3;
}

- (void)_buildSortedArrays
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FRFeedPickerSection sorter](self, "sorter"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[FRFeedPickerSection tags](self, "tags"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "sortSubscriptionsAlphabetically:", v4));
  -[FRFeedPickerSection setAlphabeticalTags:](self, "setAlphabeticalTags:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[FRFeedPickerSection sorter](self, "sorter"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[FRFeedPickerSection tags](self, "tags"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[FRFeedPickerSection popularTagIDs](self, "popularTagIDs"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "sortSubscriptionsByRecency:sortedPopularTagIDs:", v7, v8));
  -[FRFeedPickerSection setRecentlyOpenedTags:](self, "setRecentlyOpenedTags:", v9);

  v14 = (id)objc_claimAutoreleasedReturnValue(-[FRFeedPickerSection tags](self, "tags"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[FRFeedPickerSection popularTagIDs](self, "popularTagIDs"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[FRFeedPickerSection sorter](self, "sorter"));
  v12 = tagsSortedByMostFrequentlyVisited(v14, v10, v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  -[FRFeedPickerSection setMostFrequentlyVisitedTags:](self, "setMostFrequentlyVisitedTags:", v13);

}

- (NSMutableSet)mutableTags
{
  return self->_mutableTags;
}

- (void)setMutableTags:(id)a3
{
  objc_storeStrong((id *)&self->_mutableTags, a3);
}

- (FRFeedPickerDataSourceSubscriptionSorter)sorter
{
  return self->_sorter;
}

- (void)setSorter:(id)a3
{
  objc_storeStrong((id *)&self->_sorter, a3);
}

- (NSOrderedSet)popularTagIDs
{
  return self->_popularTagIDs;
}

- (void)setPopularTagIDs:(id)a3
{
  objc_storeStrong((id *)&self->_popularTagIDs, a3);
}

- (id)transformBlock
{
  return self->_transformBlock;
}

- (void)setTransformBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSArray)mostFrequentlyVisitedTags
{
  return self->_mostFrequentlyVisitedTags;
}

- (void)setMostFrequentlyVisitedTags:(id)a3
{
  objc_storeStrong((id *)&self->_mostFrequentlyVisitedTags, a3);
}

- (NSArray)recentlyOpenedTags
{
  return self->_recentlyOpenedTags;
}

- (void)setRecentlyOpenedTags:(id)a3
{
  objc_storeStrong((id *)&self->_recentlyOpenedTags, a3);
}

- (NSArray)alphabeticalTags
{
  return self->_alphabeticalTags;
}

- (void)setAlphabeticalTags:(id)a3
{
  objc_storeStrong((id *)&self->_alphabeticalTags, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alphabeticalTags, 0);
  objc_storeStrong((id *)&self->_recentlyOpenedTags, 0);
  objc_storeStrong((id *)&self->_mostFrequentlyVisitedTags, 0);
  objc_storeStrong(&self->_transformBlock, 0);
  objc_storeStrong((id *)&self->_popularTagIDs, 0);
  objc_storeStrong((id *)&self->_sorter, 0);
  objc_storeStrong((id *)&self->_mutableTags, 0);
}

@end
