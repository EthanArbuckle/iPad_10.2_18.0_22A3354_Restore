@implementation _UISharingControllerActivityItemProvider

- (_UISharingControllerActivityItemProvider)initWithCKShare:(id)a3 container:(id)a4 allowedSharingOptions:(id)a5
{
  id v8;
  id v9;
  id v10;
  _UISharingControllerActivityItemProvider *v11;
  _UISharingControllerActivityItemProvider *v12;
  objc_super v14;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)_UISharingControllerActivityItemProvider;
  v11 = -[_UISharingControllerActivityItemProvider init](&v14, sel_init);
  v12 = v11;
  if (v11)
    -[_UISharingControllerActivityItemProvider registerCKShare:container:allowedSharingOptions:](v11, "registerCKShare:container:allowedSharingOptions:", v8, v9, v10);

  return v12;
}

- (_UISharingControllerActivityItemProvider)initWithCKSharePreparationHandler:(id)a3 allowedSharingOptions:(id)a4
{
  id v6;
  id v7;
  _UISharingControllerActivityItemProvider *v8;
  _UISharingControllerActivityItemProvider *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)_UISharingControllerActivityItemProvider;
  v8 = -[_UISharingControllerActivityItemProvider init](&v11, sel_init);
  v9 = v8;
  if (v8)
    -[_UISharingControllerActivityItemProvider registerCloudKitShareWithPreparationHandler:allowedSharingOptions:](v8, "registerCloudKitShareWithPreparationHandler:allowedSharingOptions:", v6, v7);

  return v9;
}

- (void)registerCloudKitShareWithPreparationHandler:(id)a3 allowedSharingOptions:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;

  v6 = a3;
  v7 = a4;
  getCKAllowedSharingOptionsClass();
  v8 = objc_opt_class();
  v9 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __110___UISharingControllerActivityItemProvider_registerCloudKitShareWithPreparationHandler_allowedSharingOptions___block_invoke;
  v17[3] = &unk_1E16ED590;
  v10 = v7;
  v18 = v10;
  -[_UISharingControllerActivityItemProvider registerObjectOfClass:visibility:loadHandler:](self, "registerObjectOfClass:visibility:loadHandler:", v8, 0, v17);
  getCKPreSharingContextClass();
  v11 = objc_opt_class();
  v14[0] = v9;
  v14[1] = 3221225472;
  v14[2] = __110___UISharingControllerActivityItemProvider_registerCloudKitShareWithPreparationHandler_allowedSharingOptions___block_invoke_2;
  v14[3] = &unk_1E16ED5B8;
  v15 = v10;
  v16 = v6;
  v12 = v10;
  v13 = v6;
  -[_UISharingControllerActivityItemProvider registerObjectOfClass:visibility:loadHandler:](self, "registerObjectOfClass:visibility:loadHandler:", v11, 0, v14);

}

@end
