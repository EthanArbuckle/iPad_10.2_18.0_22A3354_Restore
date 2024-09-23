@implementation PFAIReferenceAnchor

+ (void)endCurrentReferenceAnchorForEntryOrientation:(id)a3 contentState:(id)a4
{
  id v6;
  id v7;
  id v8;
  _BYTE *v9;
  _BYTE *v10;
  THModelStorageAnchor *v11;

  v6 = objc_msgSend(a4, "currentReferenceAnchorForEntryOrientation:");
  if (v6)
  {
    v7 = v6;
    v8 = objc_msgSend(a3, "storage");
    v9 = objc_msgSend(a4, "referenceAnchorStartForEntryOrientation:", a3);
    v10 = objc_msgSend(v8, "length");
    if (v9 != (_BYTE *)0x7FFFFFFFFFFFFFFFLL && v10 != v9)
    {
      v11 = -[THModelStorageAnchor initWithContentNode:storageUID:range:]([THModelStorageAnchor alloc], "initWithContentNode:storageUID:range:", 0, objc_msgSend(objc_msgSend(objc_msgSend(a4, "currentDocOrientationState"), "contentNodeBody"), "nodeUniqueIDForInfo:", v8), v9, v10 - v9);
      objc_msgSend(a4, "setStorageAnchor:forAnchorId:", v11, v7);

    }
    objc_msgSend(a4, "setCurrentReferenceAnchor:forEntryOrientation:", 0, a3);
    objc_msgSend(a4, "setReferenceAnchorStart:forEntryOrientation:", 0x7FFFFFFFFFFFFFFFLL, a3);
  }
}

+ (void)startReferenceAnchorWithStackEntry:(id)a3 contentState:(id)a4 stash:(BOOL)a5
{
  _BOOL4 v5;
  id v9;
  NSString *v10;
  id v11;
  id v12;
  id v13;
  THModelStorageAnchor *v14;

  v5 = a5;
  v9 = objc_msgSend(a3, "xmlElementId");
  if (v9)
  {
    v10 = +[NSString stringWithXmlString:](NSString, "stringWithXmlString:", v9);
    v11 = objc_msgSend(a3, "currentEntryOrientationState");
    v12 = objc_msgSend(v11, "storage");
    objc_msgSend(a1, "endCurrentReferenceAnchorForEntryOrientation:contentState:", v11, a4);
    v13 = objc_msgSend(v12, "length");
    if (v5)
    {
      objc_msgSend(a4, "setReferenceAnchorStart:forEntryOrientation:", objc_msgSend(v12, "length"), v11);
      objc_msgSend(a4, "setCurrentReferenceAnchor:forEntryOrientation:", v10, v11);
    }
    v14 = -[THModelStorageAnchor initWithContentNode:storageUID:range:]([THModelStorageAnchor alloc], "initWithContentNode:storageUID:range:", 0, objc_msgSend(objc_msgSend(objc_msgSend(a4, "currentDocOrientationState"), "contentNodeBody"), "nodeUniqueIDForInfo:", v12), v13, 0);
    objc_msgSend(a4, "setStorageAnchor:forAnchorId:", v14, v10);

  }
}

+ (void)startReferenceAnchorWithStackEntry:(id)a3 contentState:(id)a4
{
  objc_msgSend(a1, "startReferenceAnchorWithStackEntry:contentState:stash:", a3, a4, 1);
}

+ (void)mapReferenceAnchorWithStackEntry:(id)a3 contentState:(id)a4
{
  objc_msgSend(a1, "startReferenceAnchorWithStackEntry:contentState:stash:", a3, a4, 0);
}

@end
