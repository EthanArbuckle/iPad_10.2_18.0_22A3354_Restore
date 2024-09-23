@implementation UINavigationController(PXDiagnosticsEnvironment)

- (id)px_diagnosticsItemProvidersForPoint:()PXDiagnosticsEnvironment inCoordinateSpace:
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v8 = a5;
  objc_msgSend(a1, "topViewController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "px_diagnosticsItemProvidersForPoint:inCoordinateSpace:", v8, a2, a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
    v11 = v10;
  else
    v11 = (void *)MEMORY[0x1E0C9AA60];
  v12 = v11;

  return v12;
}

@end
