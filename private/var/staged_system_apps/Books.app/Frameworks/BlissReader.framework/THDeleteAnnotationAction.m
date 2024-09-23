@implementation THDeleteAnnotationAction

- (THDeleteAnnotationAction)initWithAnnotation:(id)a3
{
  THDeleteAnnotationAction *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)THDeleteAnnotationAction;
  v4 = -[THDeleteAnnotationAction init](&v6, "init");
  if (v4)
    v4->_annotationUuid = (NSString *)objc_msgSend(objc_msgSend(a3, "annotationUuid"), "copy");
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)THDeleteAnnotationAction;
  -[THDeleteAnnotationAction dealloc](&v3, "dealloc");
}

- (void)commitWithChangeList:(id)a3 annotationHost:(id)a4 moc:(id)a5
{
  id v6;
  void *v7;

  v6 = objc_msgSend(a4, "annotationForUUID:includeDeleted:moc:", self->_annotationUuid, 0, a5);
  if (v6)
  {
    v7 = v6;
    objc_msgSend(v6, "setAnnotationDeleted:", 1);
    objc_msgSend(a3, "registerAnnotationDeletedWithUUID:fromContentNodeWithID:", objc_msgSend(v7, "annotationUuid"), objc_msgSend(v7, "annotationContentNodeID"));
  }
}

- (void)undoWithChangeList:(id)a3 annotationHost:(id)a4 moc:(id)a5
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

- (void)redoWithChangeList:(id)a3 annotationHost:(id)a4 moc:(id)a5
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

@end
