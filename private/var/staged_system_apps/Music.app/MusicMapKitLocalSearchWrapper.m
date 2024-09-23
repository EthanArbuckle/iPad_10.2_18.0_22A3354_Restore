@implementation MusicMapKitLocalSearchWrapper

- (MusicMapKitLocalSearchWrapper)init
{
  MusicMapKitLocalSearchWrapper *v2;
  id v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MusicMapKitLocalSearchWrapper;
  v2 = -[MusicMapKitLocalSearchWrapper init](&v5, "init");
  v3 = objc_alloc_init((Class)MKLocalSearchCompleter);
  objc_msgSend(v3, "setResultTypes:", 1);
  objc_msgSend(v3, "setDelegate:", v2);
  -[MusicMapKitLocalSearchWrapper setSearchCompleter:](v2, "setSearchCompleter:", v3);

  return v2;
}

- (void)setQuery:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[MusicMapKitLocalSearchWrapper searchCompleter](self, "searchCompleter"));
  objc_msgSend(v5, "setQueryFragment:", v4);

}

- (void)completerDidUpdateResults:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  MusicMapKitLocalSearchCompletionWrapper *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void (**v18)(_QWORD, _QWORD);
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "results"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(v4, "count")));

  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v20 = v3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "results"));
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v22;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v22 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)v10);
        v12 = objc_alloc_init(MusicMapKitLocalSearchCompletionWrapper);
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "title"));
        -[MusicMapKitLocalSearchCompletionWrapper setTitle:](v12, "setTitle:", v13);

        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "subtitle"));
        -[MusicMapKitLocalSearchCompletionWrapper setSubtitle:](v12, "setSubtitle:", v14);

        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "mapItem"));
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "placemark"));
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "location"));
        objc_msgSend(v17, "coordinate");
        -[MusicMapKitLocalSearchCompletionWrapper setCoordinate:](v12, "setCoordinate:");

        objc_msgSend(v5, "addObject:", v12);
        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v8);
  }

  v18 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[MusicMapKitLocalSearchWrapper didUpdateResults](self, "didUpdateResults"));
  ((void (**)(_QWORD, void *))v18)[2](v18, v5);

}

- (NSString)query
{
  return self->_query;
}

- (id)didUpdateResults
{
  return self->_didUpdateResults;
}

- (void)setDidUpdateResults:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (MKLocalSearchCompleter)searchCompleter
{
  return self->_searchCompleter;
}

- (void)setSearchCompleter:(id)a3
{
  objc_storeStrong((id *)&self->_searchCompleter, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchCompleter, 0);
  objc_storeStrong(&self->_didUpdateResults, 0);
  objc_storeStrong((id *)&self->_query, 0);
}

@end
