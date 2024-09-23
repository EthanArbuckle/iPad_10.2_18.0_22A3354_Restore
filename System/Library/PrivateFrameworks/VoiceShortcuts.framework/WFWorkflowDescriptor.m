@implementation WFWorkflowDescriptor

id __107__WFWorkflowDescriptor_WorkflowReferenceConvertible__getObjectsFromReferences_databaseProvider_completion___block_invoke(uint64_t a1, void *a2)
{
  objc_class *v2;
  id v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;

  v2 = (objc_class *)MEMORY[0x1E0DC7E30];
  v3 = a2;
  v4 = [v2 alloc];
  objc_msgSend(v3, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v3, "color");
  v8 = objc_msgSend(v3, "glyphCharacter");
  objc_msgSend(v3, "associatedAppBundleIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)objc_msgSend(v4, "initWithIdentifier:name:color:glyphCharacter:associatedAppBundleIdentifier:", v5, v6, v7, v8, v9);
  return v10;
}

@end
