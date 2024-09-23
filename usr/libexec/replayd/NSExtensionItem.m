@implementation NSExtensionItem

+ (NSExtensionItem)itemWithTitle:(id)a3 attachmentItem:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  id v12;

  v5 = a4;
  v6 = a3;
  v7 = objc_alloc_init((Class)NSExtensionItem);
  v8 = objc_msgSend(objc_alloc((Class)NSAttributedString), "initWithString:attributes:", v6, 0);

  objc_msgSend(v7, "setAttributedTitle:", v8);
  v9 = objc_msgSend(objc_alloc((Class)NSItemProvider), "initWithItem:typeIdentifier:", v5, kUTTypeData);

  v12 = v9;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v12, 1));
  objc_msgSend(v7, "setAttachments:", v10);

  return (NSExtensionItem *)v7;
}

@end
