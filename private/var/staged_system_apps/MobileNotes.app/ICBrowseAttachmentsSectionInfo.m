@implementation ICBrowseAttachmentsSectionInfo

- (ICBrowseAttachmentsSectionInfo)initWithSectionInfo:(id)a3 name:(id)a4 additionalObjects:(id)a5 sortDescriptors:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  ICBrowseAttachmentsSectionInfo *v15;
  ICBrowseAttachmentsSectionInfo *v16;
  NSString *v17;
  NSString *name;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  NSArray *sortedObjects;
  objc_super v26;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v26.receiver = self;
  v26.super_class = (Class)ICBrowseAttachmentsSectionInfo;
  v15 = -[ICBrowseAttachmentsSectionInfo init](&v26, "init");
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_sectionInfo, a3);
    v17 = (NSString *)objc_msgSend(v12, "copy");
    name = v16->_name;
    v16->_name = v17;

    objc_storeStrong((id *)&v16->_additionalObjects, a5);
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objects"));
    if (v19)
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objects"));
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "allObjects"));
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "arrayByAddingObjectsFromArray:", v21));

    }
    else
    {
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "allObjects"));
    }

    v23 = objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "sortedArrayUsingDescriptors:", v14));
    sortedObjects = v16->_sortedObjects;
    v16->_sortedObjects = (NSArray *)v23;

  }
  return v16;
}

- (unint64_t)numberOfObjects
{
  return -[NSArray count](self->_sortedObjects, "count");
}

- (NSArray)objects
{
  return self->_sortedObjects;
}

- (NSString)name
{
  __CFString *name;
  __CFString *v4;
  NSString *v5;

  name = (__CFString *)objc_claimAutoreleasedReturnValue(-[NSFetchedResultsSectionInfo name](self->_sectionInfo, "name"));
  v4 = name;
  if (!name)
  {
    if (self->_name)
      name = (__CFString *)self->_name;
    else
      name = &stru_1005704B8;
  }
  v5 = name;

  return v5;
}

- (NSString)indexTitle
{
  __CFString *v2;
  __CFString *v3;
  NSString *v4;

  v2 = (__CFString *)objc_claimAutoreleasedReturnValue(-[NSFetchedResultsSectionInfo indexTitle](self->_sectionInfo, "indexTitle"));
  v3 = v2;
  if (!v2)
    v2 = &stru_1005704B8;
  v4 = v2;

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sortedObjects, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_sectionInfo, 0);
  objc_storeStrong((id *)&self->_additionalObjects, 0);
}

@end
