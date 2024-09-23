@implementation ICUnifiedNoteContext

- (ICUnifiedNoteContext)initWithModernNoteContext:(id)a3 htmlNoteContext:(id)a4 options:(unint64_t)a5
{
  id v9;
  id v10;
  ICUnifiedNoteContext *v11;
  ICUnifiedNoteContext *v12;
  objc_super v14;

  v9 = a3;
  v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)ICUnifiedNoteContext;
  v11 = -[ICUnifiedNoteContext init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_modernNoteContext, a3);
    objc_storeStrong((id *)&v12->_htmlNoteContext, a4);
    v12->_options = a5;
  }

  return v12;
}

- (ICUnifiedNoteContext)initWithModernNoteContext:(id)a3 htmlNoteContext:(id)a4
{
  return -[ICUnifiedNoteContext initWithModernNoteContext:htmlNoteContext:options:](self, "initWithModernNoteContext:htmlNoteContext:options:", a3, a4, 3);
}

- (void)enableHTMLContextChangeLogging
{
  void *v3;
  id v4;

  objc_opt_class();
  -[ICUnifiedNoteContext htmlNoteContext](self, "htmlNoteContext");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  ICCheckedDynamicCast();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "enableChangeLogging:", 1);

}

- (id)managedObjectIDForURIRepresentation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;

  v4 = a3;
  -[ICUnifiedNoteContext modernStoreCoordinator](self, "modernStoreCoordinator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "ic_managedObjectIDForURIRepresentation:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v8 = v6;
  }
  else
  {
    -[ICUnifiedNoteContext htmlStoreCoordinator](self, "htmlStoreCoordinator");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "ic_managedObjectIDForURIRepresentation:", v4);
    v8 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v8;
}

- (id)managedObjectIDForURIString:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;

  v4 = a3;
  -[ICUnifiedNoteContext modernStoreCoordinator](self, "modernStoreCoordinator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "ic_managedObjectIDForURIString:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v8 = v6;
  }
  else
  {
    -[ICUnifiedNoteContext htmlStoreCoordinator](self, "htmlStoreCoordinator");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "ic_managedObjectIDForURIString:", v4);
    v8 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v8;
}

- (unint64_t)options
{
  return self->_options;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_htmlNoteContext, 0);
  objc_storeStrong((id *)&self->_modernNoteContext, 0);
}

- (ICNoteContext)modernNoteContext
{
  return self->_modernNoteContext;
}

- (NoteContext)htmlNoteContext
{
  return self->_htmlNoteContext;
}

- (NSPersistentStoreCoordinator)modernStoreCoordinator
{
  void *v2;
  void *v3;
  void *v4;

  -[ICUnifiedNoteContext modernNoteContext](self, "modernNoteContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "persistentContainer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "persistentStoreCoordinator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSPersistentStoreCoordinator *)v4;
}

- (NSPersistentStoreCoordinator)htmlStoreCoordinator
{
  void *v2;
  void *v3;

  -[ICUnifiedNoteContext htmlNoteContext](self, "htmlNoteContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "persistentStoreCoordinator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSPersistentStoreCoordinator *)v3;
}

- (NSManagedObjectContext)modernManagedObjectContext
{
  ICUnifiedNoteContext *v2;
  unsigned int v3;
  ICNoteContext *v4;
  ICNoteContext *v5;
  char **v6;
  id v7;

  v2 = self;
  v3 = -[ICUnifiedNoteContext resolvedPrefersViewContext](v2, sel_resolvedPrefersViewContext);
  v4 = -[ICUnifiedNoteContext modernNoteContext](v2, sel_modernNoteContext);
  v5 = v4;
  v6 = &selRef_managedObjectContext;
  if (!v3)
    v6 = &selRef_workerManagedObjectContext;
  v7 = objc_msgSend(v4, *v6);

  return (NSManagedObjectContext *)v7;
}

- (ICNotesCrossProcessChangeCoordinator)modernCrossProcessChangeCoordinator
{
  return (ICNotesCrossProcessChangeCoordinator *)sub_1ACA14318(self, (uint64_t)a2, (SEL *)&selRef_modernNoteContext, (SEL *)&selRef_crossProcessChangeCoordinator);
}

- (NSManagedObjectContext)htmlManagedObjectContext
{
  return (NSManagedObjectContext *)sub_1ACA14318(self, (uint64_t)a2, (SEL *)&selRef_htmlNoteContext, (SEL *)&selRef_managedObjectContext);
}

- (id)managedObjectContextForObjectID:(id)a3
{
  id v4;
  ICUnifiedNoteContext *v5;
  void *v6;

  v4 = a3;
  v5 = self;
  v6 = (void *)ICUnifiedNoteContext.managedObjectContext(for:)((NSManagedObjectID)v4);

  return v6;
}

- (id)managedObjectContextForObject:(id)a3 error:(id *)a4
{
  id v5;
  ICUnifiedNoteContext *v6;
  id v7;

  v5 = a3;
  v6 = self;
  v7 = sub_1ACA15338(v5);

  return v7;
}

- (BOOL)resolvedPrefersViewContext
{
  ICUnifiedNoteContext *v2;
  unint64_t v3;
  BOOL v5;

  v2 = self;
  v3 = -[ICUnifiedNoteContext options](v2, sel_options) & 3;
  if (v3 == 2)
  {

    return 0;
  }
  else if (v3 == 1)
  {

    return 1;
  }
  else
  {
    if (qword_1ED6E8D40 != -1)
      swift_once();
    sub_1ACA42F9C();

    return v5;
  }
}

- (NSManagedObjectID)defaultAccountObjectID
{
  void *v3;
  ICUnifiedNoteContext *v4;
  NoteContext *v5;
  ICUnifiedNoteContext *v6;
  id v7;

  v3 = (void *)objc_opt_self();
  v4 = self;
  v5 = -[ICUnifiedNoteContext htmlNoteContext](v4, sel_htmlNoteContext);
  v6 = (ICUnifiedNoteContext *)objc_msgSend(v3, sel_defaultAccountWithHTMLNoteContext_, v5);

  if (v6)
  {
    v7 = -[ICUnifiedNoteContext objectID](v6, sel_objectID);

    v4 = v6;
  }
  else
  {
    v7 = 0;
  }

  return (NSManagedObjectID *)v7;
}

- (ICLegacyAccount)legacyAccountForLocalAccount
{
  void *v3;
  ICUnifiedNoteContext *v4;
  NoteContext *v5;
  id v6;

  v3 = (void *)objc_opt_self();
  v4 = self;
  v5 = -[ICUnifiedNoteContext htmlNoteContext](v4, sel_htmlNoteContext);
  v6 = objc_msgSend(v3, sel_legacyAccountForLocalAccountWithContext_, v5);

  return (ICLegacyAccount *)v6;
}

- (id)legacyAccountForEmailAddress:(id)a3
{
  void *v4;
  ICUnifiedNoteContext *v5;
  void *v6;
  NoteContext *v7;
  id v8;

  sub_1ACA420C0();
  v4 = (void *)objc_opt_self();
  v5 = self;
  v6 = (void *)sub_1ACA42090();
  v7 = -[ICUnifiedNoteContext htmlNoteContext](v5, sel_htmlNoteContext);
  v8 = objc_msgSend(v4, sel_accountForEmailAddress_context_, v6, v7);

  swift_bridgeObjectRelease();
  return v8;
}

- (id)legacyFolderWithIdentifier:(id)a3
{
  return sub_1ACA14D9C(self, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_folderForIdentifier_);
}

- (id)legacyNoteWithIdentifier:(id)a3
{
  return sub_1ACA14D9C(self, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_noteForIdentifier_);
}

- (id)legacyAttachmentWithIdentifier:(id)a3
{
  return sub_1ACA14D9C(self, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_attachmentForIdentifier_);
}

@end
