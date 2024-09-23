@implementation ASKLoadBundleResourceOperation

- (ASKLoadBundleResourceOperation)initWithResourceName:(id)a3 searchBundles:(id)a4
{
  id v6;
  id v7;
  ASKLoadBundleResourceOperation *v8;
  NSString *v9;
  NSString *resourceName;
  NSArray *v11;
  NSArray *searchBundles;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)ASKLoadBundleResourceOperation;
  v8 = -[ASKLoadBundleResourceOperation init](&v14, "init");
  if (v8)
  {
    v9 = (NSString *)objc_msgSend(v6, "copy");
    resourceName = v8->_resourceName;
    v8->_resourceName = v9;

    v11 = (NSArray *)objc_msgSend(v7, "copy");
    searchBundles = v8->_searchBundles;
    v8->_searchBundles = v11;

  }
  return v8;
}

- (void)main
{
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  ASKLoadBundleResourceOperation *v14;
  void *v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  NSErrorUserInfoKey v21;
  void *v22;
  _BYTE v23[128];

  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ASKLoadBundleResourceOperation searchBundles](self, "searchBundles"));
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v18;
LABEL_3:
    v7 = 0;
    while (1)
    {
      if (*(_QWORD *)v18 != v6)
        objc_enumerationMutation(v3);
      v8 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v7);
      if ((-[ASKLoadBundleResourceOperation isCancelled](self, "isCancelled") & 1) != 0)
        break;
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[ASKLoadBundleResourceOperation resourceName](self, "resourceName"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:inBundle:compatibleWithTraitCollection:](UIImage, "imageNamed:inBundle:compatibleWithTraitCollection:", v9, v8, 0));

      if (v10)
      {
        v14 = self;
        v15 = v10;
        v16 = 0;
        goto LABEL_13;
      }
      if (v5 == (id)++v7)
      {
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
        if (v5)
          goto LABEL_3;
        goto LABEL_10;
      }
    }
  }
  else
  {
LABEL_10:

    if ((-[ASKLoadBundleResourceOperation isCancelled](self, "isCancelled") & 1) != 0)
      return;
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[ASKLoadBundleResourceOperation resourceName](self, "resourceName"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[ASKLoadBundleResourceOperation searchBundles](self, "searchBundles"));
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("No image found for %@ in %@"), v11, v12));

    v21 = NSLocalizedDescriptionKey;
    v22 = v3;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v22, &v21, 1));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("ASKLoadBundleResourceOperationErrorDomain"), 560557415, v13));

    v14 = self;
    v15 = 0;
    v16 = v10;
LABEL_13:
    -[ASKLoadResourceOperation didCompleteWithResource:error:](v14, "didCompleteWithResource:error:", v15, v16);

  }
}

- (NSString)resourceName
{
  return self->_resourceName;
}

- (NSArray)searchBundles
{
  return self->_searchBundles;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchBundles, 0);
  objc_storeStrong((id *)&self->_resourceName, 0);
}

@end
