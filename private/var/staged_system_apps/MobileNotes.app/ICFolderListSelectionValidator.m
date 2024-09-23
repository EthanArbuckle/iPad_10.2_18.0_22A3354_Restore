@implementation ICFolderListSelectionValidator

- (NSManagedObjectContext)modernContext
{
  return (NSManagedObjectContext *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                           + OBJC_IVAR___ICFolderListSelectionValidator_modernContext));
}

- (NSManagedObjectContext)htmlContext
{
  return (NSManagedObjectContext *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                           + OBJC_IVAR___ICFolderListSelectionValidator_htmlContext));
}

- (BOOL)hidesSystemPaperNotesInCustomFolders
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR___ICFolderListSelectionValidator_hidesSystemPaperNotesInCustomFolders);
}

- (BOOL)hidesMathNotesInCustomFolders
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR___ICFolderListSelectionValidator_hidesMathNotesInCustomFolders);
}

- (BOOL)hidesCallNotesInCustomFolders
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR___ICFolderListSelectionValidator_hidesCallNotesInCustomFolders);
}

- (ICFolderListSelectionValidator)initWithModernContext:(id)a3 htmlContext:(id)a4 hidesSystemPaperNotesInCustomFolders:(BOOL)a5 hidesMathNotesInCustomFolders:(BOOL)a6 hidesCallNotesInCustomFolders:(BOOL)a7
{
  objc_class *ObjectType;
  id v14;
  id v15;
  objc_super v17;

  ObjectType = (objc_class *)swift_getObjectType(self);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___ICFolderListSelectionValidator_modernContext) = (Class)a3;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___ICFolderListSelectionValidator_htmlContext) = (Class)a4;
  *((_BYTE *)&self->super.isa + OBJC_IVAR___ICFolderListSelectionValidator_hidesSystemPaperNotesInCustomFolders) = a5;
  *((_BYTE *)&self->super.isa + OBJC_IVAR___ICFolderListSelectionValidator_hidesMathNotesInCustomFolders) = a6;
  *((_BYTE *)&self->super.isa + OBJC_IVAR___ICFolderListSelectionValidator_hidesCallNotesInCustomFolders) = a7;
  v17.receiver = self;
  v17.super_class = ObjectType;
  v14 = a3;
  v15 = a4;
  return -[ICFolderListSelectionValidator init](&v17, "init");
}

- (ICFolderListSelectionValidator)initWithModernContext:(id)a3 htmlContext:(id)a4
{
  void *v7;
  id v8;
  id v9;
  ICFolderListSelectionValidator *v10;

  v7 = (void *)objc_opt_self(ICAccount);
  v8 = a3;
  v9 = a4;
  v10 = -[ICFolderListSelectionValidator initWithModernContext:htmlContext:hidesSystemPaperNotesInCustomFolders:hidesMathNotesInCustomFolders:hidesCallNotesInCustomFolders:](self, "initWithModernContext:htmlContext:hidesSystemPaperNotesInCustomFolders:hidesMathNotesInCustomFolders:hidesCallNotesInCustomFolders:", v8, v9, objc_msgSend(v7, "hidesSystemPaperNotesInCustomFolders"), objc_msgSend(v7, "hidesMathNotesInCustomFolders"), objc_msgSend(v7, "hidesCallNotesInCustomFolders"));

  return v10;
}

- (BOOL)isSelectionAppropriateForObjectID:(id)a3 selectedContainerIdentifiers:(id)a4
{
  id v4;
  uint64_t v7;
  uint64_t v8;
  id v9;
  ICFolderListSelectionValidator *v10;
  ICFolderListSelectionValidator *v11;
  ICFolderListSelectionValidator *v12;
  char v13;

  v4 = a4;
  if (a4)
  {
    v7 = sub_1000163BC(0, (unint64_t *)&qword_1005D3D00, NSObject_ptr);
    v8 = sub_1001452A0(&qword_1005D2E08, (unint64_t *)&qword_1005D3D00, NSObject_ptr);
    v4 = (id)static Set._unconditionallyBridgeFromObjectiveC(_:)(v4, v7, v8);
  }
  v9 = a3;
  v10 = self;
  v11 = (ICFolderListSelectionValidator *)sub_1001BAC5C(v9);
  if (v11)
  {
    v12 = v11;
    v13 = sub_1001BAD84(v11, (uint64_t)v4, 0);

    v10 = v12;
  }
  else
  {
    v13 = 1;
  }

  swift_bridgeObjectRelease(v4);
  return v13 & 1;
}

- (BOOL)isSelectionAppropriateForObject:(id)a3 selectedContainerIdentifiers:(id)a4
{
  id v4;
  uint64_t v7;
  uint64_t v8;
  id v9;
  ICFolderListSelectionValidator *v10;
  char v11;

  v4 = a4;
  if (a4)
  {
    v7 = sub_1000163BC(0, (unint64_t *)&qword_1005D3D00, NSObject_ptr);
    v8 = sub_1001452A0(&qword_1005D2E08, (unint64_t *)&qword_1005D3D00, NSObject_ptr);
    v4 = (id)static Set._unconditionallyBridgeFromObjectiveC(_:)(v4, v7, v8);
  }
  v9 = a3;
  v10 = self;
  v11 = sub_1001BAD84(v9, (uint64_t)v4, 0);

  swift_bridgeObjectRelease(v4);
  return v11 & 1;
}

- (BOOL)isSelectionAppropriateForObjectID:(id)a3 tagSelection:(id)a4
{
  id v6;
  ICFolderListSelectionValidator *v7;
  ICFolderListSelectionValidator *v8;
  ICFolderListSelectionValidator *v9;
  ICFolderListSelectionValidator *v10;
  char v11;

  v6 = a3;
  v7 = self;
  v8 = (ICFolderListSelectionValidator *)a4;
  v9 = (ICFolderListSelectionValidator *)sub_1001BAC5C(v6);
  if (v9)
  {
    v10 = v9;
    v11 = sub_1001BAD84(v9, 0, v8);

    v8 = v7;
    v7 = v10;
  }
  else
  {
    v11 = 1;
  }

  return v11 & 1;
}

- (BOOL)isSelectionAppropriateForObject:(id)a3 tagSelection:(id)a4
{
  id v6;
  id v7;
  ICFolderListSelectionValidator *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  LOBYTE(a4) = sub_1001BAD84(v6, 0, a4);

  return a4 & 1;
}

- (BOOL)isSelectionAppropriateForObjectID:(id)a3 selectedContainerIdentifiers:(id)a4 tagSelection:(id)a5
{
  id v6;
  uint64_t v9;
  uint64_t v10;
  id v11;
  ICFolderListSelectionValidator *v12;
  id v13;
  ICFolderListSelectionValidator *v14;
  ICFolderListSelectionValidator *v15;
  char v16;

  v6 = a4;
  if (a4)
  {
    v9 = sub_1000163BC(0, (unint64_t *)&qword_1005D3D00, NSObject_ptr);
    v10 = sub_1001452A0(&qword_1005D2E08, (unint64_t *)&qword_1005D3D00, NSObject_ptr);
    v6 = (id)static Set._unconditionallyBridgeFromObjectiveC(_:)(v6, v9, v10);
  }
  v11 = a3;
  v12 = self;
  v13 = a5;
  v14 = (ICFolderListSelectionValidator *)sub_1001BAC5C(v11);
  if (v14)
  {
    v15 = v14;
    v16 = sub_1001BAD84(v14, (uint64_t)v6, a5);

    v12 = v15;
  }
  else
  {
    v16 = 1;
  }

  swift_bridgeObjectRelease(v6);
  return v16 & 1;
}

- (BOOL)isSelectionAppropriateForObject:(id)a3 selectedContainerIdentifiers:(id)a4 tagSelection:(id)a5
{
  id v6;
  uint64_t v9;
  uint64_t v10;
  id v11;
  id v12;
  ICFolderListSelectionValidator *v13;
  char v14;

  v6 = a4;
  if (a4)
  {
    v9 = sub_1000163BC(0, (unint64_t *)&qword_1005D3D00, NSObject_ptr);
    v10 = sub_1001452A0(&qword_1005D2E08, (unint64_t *)&qword_1005D3D00, NSObject_ptr);
    v6 = (id)static Set._unconditionallyBridgeFromObjectiveC(_:)(v6, v9, v10);
  }
  v11 = a3;
  v12 = a5;
  v13 = self;
  v14 = sub_1001BAD84(v11, (uint64_t)v6, a5);

  swift_bridgeObjectRelease(v6);
  return v14 & 1;
}

- (ICFolderListSelectionValidator)init
{
  ICFolderListSelectionValidator *result;

  result = (ICFolderListSelectionValidator *)_swift_stdlib_reportUnimplementedInitializer("MobileNotes.FolderListSelectionValidator", 40, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

}

@end
