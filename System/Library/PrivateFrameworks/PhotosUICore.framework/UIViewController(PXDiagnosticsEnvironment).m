@implementation UIViewController(PXDiagnosticsEnvironment)

- (id)px_diagnosticsItemProvidersForPoint:()PXDiagnosticsEnvironment inCoordinateSpace:
{
  id v8;
  id v9;
  char IsNull;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v8 = a5;
  v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (objc_msgSend(a1, "isViewLoaded"))
  {
    IsNull = PXPointIsNull();
    if (v8)
    {
      if ((IsNull & 1) == 0)
      {
        objc_msgSend(a1, "view");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "convertPoint:fromCoordinateSpace:", v8, a2, a3);
        objc_msgSend(v11, "hitTest:withEvent:", 0);
        v12 = objc_claimAutoreleasedReturnValue();
        if (v12)
        {
          v13 = (void *)v12;
          do
          {
            if (objc_msgSend(v13, "conformsToProtocol:", &unk_1EE9B4260))
            {
              objc_msgSend(v13, "px_diagnosticsItemProvidersForPoint:inCoordinateSpace:", v8, a2, a3);
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v9, "addObjectsFromArray:", v14);

            }
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              +[PXDiagnosticsItemProvider providerWithItem:identifier:](PXDiagnosticsItemProvider, "providerWithItem:identifier:", v13, CFSTR("PXDiagnosticsItemIdentifierScrollView"));
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v9, "addObject:", v15);

            }
            objc_msgSend(v13, "superview");
            v16 = (void *)objc_claimAutoreleasedReturnValue();

            if (v16 == v11)
              break;
            v13 = v16;
          }
          while (v16);

        }
      }
    }
  }

  return v9;
}

@end
