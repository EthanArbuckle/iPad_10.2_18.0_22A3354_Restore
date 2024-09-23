@implementation PKStrokeSelectionCoherence

+ (NSArray)readableTypeIdentifiersForItemProvider
{
  return (NSArray *)objc_msgSend(MEMORY[0x1E0CD1240], "readableTypeIdentifiersForItemProvider");
}

+ (id)objectWithItemProviderData:(id)a3 typeIdentifier:(id)a4 error:(id *)a5
{
  void *v7;
  id v8;
  id v9;
  void *v10;

  v7 = (void *)MEMORY[0x1E0CD1240];
  v8 = a4;
  v9 = a3;
  objc_msgSend(v7, "objectWithItemProviderData:typeIdentifier:drawingClass:error:", v9, v8, objc_opt_class(), a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

@end
