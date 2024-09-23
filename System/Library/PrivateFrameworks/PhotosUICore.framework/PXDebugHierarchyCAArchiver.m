@implementation PXDebugHierarchyCAArchiver

+ (BOOL)archiveDebugHierarchyWithIdentifier:(id)a3 provider:(id)a4 toURL:(id)a5 error:(id *)a6
{
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  const __CFString *v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v9 = a5;
  +[PXDebugHierarchyCALayerObjectsBuilder buildLayerTreeForDebugHierarchyWithIdentifier:provider:options:](PXDebugHierarchyCALayerObjectsBuilder, "buildLayerTreeForDebugHierarchyWithIdentifier:provider:options:", a3, a4, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = CFSTR("rootLayer");
  v16[0] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB36F8]), "initRequiringSecureCoding:", 0);
  objc_msgSend(v12, "encodeObject:forKey:", v11, CFSTR("root"));
  objc_msgSend(v12, "encodedData");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a6) = objc_msgSend(v13, "writeToURL:options:error:", v9, 0, a6);

  return (char)a6;
}

@end
