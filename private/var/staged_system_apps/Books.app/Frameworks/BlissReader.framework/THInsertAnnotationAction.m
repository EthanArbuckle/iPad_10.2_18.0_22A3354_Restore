@implementation THInsertAnnotationAction

- (THInsertAnnotationAction)initWithVersion:(id)a3 bookVersion:(id)a4 assetID:(id)a5 creatorID:(id)a6 contentNode:(id)a7 storage:(id)a8 updateBlock:(id)a9
{
  THInsertAnnotationAction *v15;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)THInsertAnnotationAction;
  v15 = -[THInsertAnnotationAction init](&v17, "init");
  if (v15)
  {
    v15->_version = (NSString *)a3;
    v15->_bookVersion = (NSString *)a4;
    v15->_assetID = (NSString *)a5;
    v15->_creatorID = (NSString *)a6;
    v15->_contentNode = (THModelContentNode *)a7;
    v15->_storage = (THWPStorage *)a8;
    v15->_updateBlock = objc_msgSend(a9, "copy");
  }
  return v15;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)THInsertAnnotationAction;
  -[THInsertAnnotationAction dealloc](&v3, "dealloc");
}

- (void)commitWithChangeList:(id)a3 annotationHost:(id)a4 moc:(id)a5
{
  THUpdateAnnotationAction *v9;
  id v10;

  v10 = objc_msgSend(objc_alloc((Class)AEAnnotation), "initWithContext:", a5);
  objc_msgSend(v10, "setAnnotationUuid:", +[NSString UUID](NSString, "UUID"));
  objc_msgSend(v10, "setAnnotationAssetID:", self->_assetID);
  objc_msgSend(v10, "setAnnotationCreatorIdentifier:", self->_creatorID);
  objc_msgSend(v10, "setAnnotationVersion:", self->_version);
  objc_msgSend(v10, "setAnnotationBookVersion:", self->_bookVersion);
  objc_msgSend(v10, "setAnnotationCreationDate:", +[NSDate date](NSDate, "date"));
  objc_msgSend(v10, "setPlStorageUUID:", -[THModelContentNode annotationIDForInfo:](self->_contentNode, "annotationIDForInfo:", self->_storage));
  self->_annotationUuid = (NSString *)objc_msgSend(objc_msgSend(v10, "annotationUuid"), "copy");
  if (self->_updateBlock)
  {
    v9 = -[THUpdateAnnotationAction initWithAnnotation:contentNode:updateBlock:]([THUpdateAnnotationAction alloc], "initWithAnnotation:contentNode:updateBlock:", v10, self->_contentNode, self->_updateBlock);
    -[THUpdateAnnotationAction commitWithChangeList:annotationHost:moc:](v9, "commitWithChangeList:annotationHost:moc:", 0, a4, a5);

  }
  objc_msgSend(v10, "setAnnotationModificationDate:", objc_msgSend(v10, "annotationCreationDate"));
  objc_msgSend(a3, "registerAnnotationAddedWithUUID:toContentNodeWithID:", objc_msgSend(v10, "annotationUuid"), objc_msgSend(v10, "annotationContentNodeID"));

}

- (void)undoWithChangeList:(id)a3 annotationHost:(id)a4 moc:(id)a5
{
  id v6;
  void *v7;

  v6 = objc_msgSend(a4, "annotationForUUID:includeDeleted:moc:", self->_annotationUuid, 1, a5);
  if (v6)
  {
    v7 = v6;
    objc_msgSend(v6, "setAnnotationDeleted:", 1);
    objc_msgSend(a3, "registerAnnotationDeletedWithUUID:fromContentNodeWithID:", objc_msgSend(v7, "annotationUuid"), objc_msgSend(v7, "annotationContentNodeID"));
  }
}

- (void)redoWithChangeList:(id)a3 annotationHost:(id)a4 moc:(id)a5
{
  id v6;
  void *v7;

  v6 = objc_msgSend(a4, "annotationForUUID:includeDeleted:moc:", self->_annotationUuid, 1, a5);
  if (v6)
  {
    v7 = v6;
    objc_msgSend(v6, "setAnnotationDeleted:", 0);
    objc_msgSend(a3, "registerAnnotationAddedWithUUID:toContentNodeWithID:", objc_msgSend(v7, "annotationUuid"), objc_msgSend(v7, "annotationContentNodeID"));
  }
}

@end
