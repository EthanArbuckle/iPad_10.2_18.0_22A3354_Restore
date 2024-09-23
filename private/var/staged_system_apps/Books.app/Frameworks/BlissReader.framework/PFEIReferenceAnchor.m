@implementation PFEIReferenceAnchor

+ (void)endCurrentReferenceAnchorWithContentState:(id)a3
{
  id v4;
  id v5;
  id v6;
  id v7;
  _BYTE *v8;
  _BYTE *v9;
  THModelStorageAnchor *v10;

  v4 = objc_msgSend(objc_msgSend(a3, "currentHtmlStackEntry"), "currentEntryMediaState");
  v5 = objc_msgSend(a3, "referenceAnchorID");
  if (v5)
  {
    v6 = v5;
    v7 = objc_msgSend(v4, "storage");
    v8 = objc_msgSend(a3, "referenceAnchorStartIndex");
    v9 = objc_msgSend(v7, "length");
    if (v8 != (_BYTE *)0x7FFFFFFFFFFFFFFFLL && v9 != v8)
    {
      v10 = -[THModelStorageAnchor initWithContentNode:storageUID:range:]([THModelStorageAnchor alloc], "initWithContentNode:storageUID:range:", 0, objc_msgSend(objc_msgSend(objc_msgSend(a3, "orientationState"), "contentNodeBody"), "nodeUniqueIDForInfo:", v7), v8, v9 - v8);
      objc_msgSend(a3, "setStorageAnchor:forAnchorId:", v10, v6);

    }
    objc_msgSend(a3, "setReferenceAnchorID:", 0);
    objc_msgSend(a3, "setReferenceAnchorStartIndex:", 0x7FFFFFFFFFFFFFFFLL);
  }
}

+ (void)startReferenceAnchorWithStackEntry:(id)a3 contentState:(id)a4 stash:(BOOL)a5
{
  _BOOL4 v5;
  id v9;
  NSString *v10;
  id v11;
  id v12;
  THModelStorageAnchor *v13;

  v5 = a5;
  v9 = objc_msgSend(a3, "xmlElementId");
  if (v9)
  {
    v10 = +[NSString stringWithXmlString:](NSString, "stringWithXmlString:", v9);
    v11 = objc_msgSend(objc_msgSend(a3, "currentEntryMediaState"), "storage");
    objc_msgSend(a1, "endCurrentReferenceAnchorWithContentState:", a4);
    v12 = objc_msgSend(v11, "length");
    if (v5)
    {
      objc_msgSend(a4, "setReferenceAnchorStartIndex:", objc_msgSend(v11, "length"));
      objc_msgSend(a4, "setReferenceAnchorID:", v10);
    }
    v13 = -[THModelStorageAnchor initWithContentNode:storageUID:range:]([THModelStorageAnchor alloc], "initWithContentNode:storageUID:range:", 0, objc_msgSend(objc_msgSend(objc_msgSend(a4, "orientationState"), "contentNodeBody"), "nodeUniqueIDForInfo:", v11), v12, 0);
    objc_msgSend(a4, "setStorageAnchor:forAnchorId:", v13, v10);

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
