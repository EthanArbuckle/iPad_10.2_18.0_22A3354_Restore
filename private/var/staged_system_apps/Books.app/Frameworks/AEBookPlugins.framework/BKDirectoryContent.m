@implementation BKDirectoryContent

- (void)setDirectoryDelegate:(id)a3
{
  id WeakRetained;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_directoryDelegate);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_directoryDelegate, obj);
    *(_BYTE *)&self->_directoryContentFlags = *(_BYTE *)&self->_directoryContentFlags & 0xFE | objc_opt_respondsToSelector(obj, "directoryContent:pageTitleForPageNumber:") & 1;
  }

}

- (void)didSelectLocation:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[BKDirectoryContent directoryDelegate](self, "directoryDelegate"));
  objc_msgSend(v5, "directoryContent:didSelectLocation:", self, v4);

}

- (void)didSelectBookmarkForLocation:(id)a3 annotationUUID:(id)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  v6 = a4;
  objc_opt_class(BKEpubCFILocation);
  v8 = BUDynamicCast(v7, v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKDirectoryContent directoryDelegate](self, "directoryDelegate"));
    objc_msgSend(v10, "directoryContent:didSelectBookmarkForLocation:annotationUUID:", self, v9, v6);

  }
  else
  {
    -[BKDirectoryContent didSelectLocation:](self, "didSelectLocation:", v11);
  }

}

- (void)didSelectHighlightForLocation:(id)a3 annotationUUID:(id)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  v6 = a4;
  objc_opt_class(BKEpubCFILocation);
  v8 = BUDynamicCast(v7, v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKDirectoryContent directoryDelegate](self, "directoryDelegate"));
    objc_msgSend(v10, "directoryContent:didSelectHighlightForLocation:annotationUUID:", self, v9, v6);

  }
  else
  {
    -[BKDirectoryContent didSelectLocation:](self, "didSelectLocation:", v11);
  }

}

- (int64_t)pageNumberForLocation:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKDirectoryContent directoryDelegate](self, "directoryDelegate"));
  v6 = objc_msgSend(v5, "directoryContent:pageNumberForLocation:", self, v4);

  return (int64_t)v6;
}

- (id)pageTitleForPageNumber:(int64_t)a3
{
  void *v5;
  void *v6;

  if ((unint64_t)(a3 - 1) > 0x7FFFFFFFFFFFFFFDLL)
  {
    v6 = 0;
  }
  else if ((*(_BYTE *)&self->_directoryContentFlags & 1) == 0
         || (v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKDirectoryContent directoryDelegate](self, "directoryDelegate")),
             v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "directoryContent:pageTitleForPageNumber:", self, a3)),
             v5,
             !v6))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%lu"), a3));
  }
  return v6;
}

- (id)locationForPageNumber:(int64_t)a3
{
  void *v5;
  void *v6;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKDirectoryContent directoryDelegate](self, "directoryDelegate"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "directoryContent:locationForPageNumber:", self, a3));

  return v6;
}

- (BKDirectoryContentDelegate)directoryDelegate
{
  return (BKDirectoryContentDelegate *)objc_loadWeakRetained((id *)&self->_directoryDelegate);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_directoryDelegate);
}

@end
