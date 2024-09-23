@implementation WFLibrary

- (NSString)dotRepresentation
{
  WFLibrary *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v2 = self;
  Library.dotRepresentation.getter();
  v4 = v3;

  if (v4)
  {
    v5 = (void *)sub_1C1B0F1F4();
    swift_bridgeObjectRelease();
  }
  else
  {
    v5 = 0;
  }
  return (NSString *)v5;
}

- (NSArray)collections
{
  WFLibrary *v2;
  void *v3;

  v2 = self;
  Library.collections.getter();

  sub_1C15B882C(0, (unint64_t *)&qword_1EF6FD9C0);
  v3 = (void *)sub_1C1B0F374();
  swift_bridgeObjectRelease();
  return (NSArray *)v3;
}

- (BOOL)addShortcutWithIdentifier:(id)a3 toCollectionWithIdentifier:(id)a4 error:(id *)a5
{
  BOOL result;

  sub_1C1685940(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (uint64_t)a5, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))Library.addShortcut(identifier:toCollectionWithIdentifier:));
  return result;
}

- (BOOL)insertShortcutWithIdentifier:(id)a3 atIndex:(int64_t)a4 toCollection:(id)a5 error:(id *)a6
{
  BOOL result;

  sub_1C1685A74(self, (uint64_t)a2, (uint64_t)a3, a4, (uint64_t)a5, (uint64_t)a6, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))Library.insertShortcut(identifier:atIndex:toCollection:));
  return result;
}

- (BOOL)removeShortcutWithIdentifier:(id)a3 fromCollectionWithIdentifier:(id)a4 error:(id *)a5
{
  BOOL result;

  sub_1C1685940(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (uint64_t)a5, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))Library.removeShortcut(identifier:fromCollectionWithIdentifier:));
  return result;
}

- (BOOL)moveShortcutWithIdentifier:(id)a3 toIndex:(int64_t)a4 ofCollectionWithIdentifier:(id)a5 error:(id *)a6
{
  BOOL result;

  sub_1C1685A74(self, (uint64_t)a2, (uint64_t)a3, a4, (uint64_t)a5, (uint64_t)a6, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))Library.moveShortcut(identifier:toIndex:ofCollectionWithIdentifier:));
  return result;
}

- (id)collectionsAndFoldersContainingShortcut:(id)a3 error:(id *)a4
{
  WFLibrary *v5;
  void *v6;

  sub_1C1B0F224();
  v5 = self;
  Library.collectionsAndFoldersContaining(shortcut:)();
  swift_bridgeObjectRelease();

  sub_1C15B882C(0, (unint64_t *)&qword_1EF6FD9C0);
  v6 = (void *)sub_1C1B0F374();
  swift_bridgeObjectRelease();
  return v6;
}

- (id)collectionAndFolderIdentifiersContainingShortcut:(id)a3 error:(id *)a4
{
  WFLibrary *v5;
  void *v6;

  sub_1C1B0F224();
  v5 = self;
  Library.collectionAndFolderIdentifiersContaining(shortcut:)();
  swift_bridgeObjectRelease();

  v6 = (void *)sub_1C1B0F4D0();
  swift_bridgeObjectRelease();
  return v6;
}

- (id)collectionsContainingShortcut:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  WFLibrary *v7;
  void *v8;

  v4 = sub_1C1B0F224();
  v6 = v5;
  v7 = self;
  Library.collectionsContaining(shortcut:)(v4, v6);

  swift_bridgeObjectRelease();
  sub_1C15B882C(0, (unint64_t *)&qword_1EF6FD9C0);
  v8 = (void *)sub_1C1B0F374();
  swift_bridgeObjectRelease();
  return v8;
}

- (id)collectionWithWorkflowType:(id)a3
{
  id v4;
  WFLibrary *v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = self;
  Library.collection(workflowType:)(v4);
  v7 = v6;

  return v7;
}

- (id)collectionWithIdentifier:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  WFLibrary *v7;
  void *v8;

  v4 = sub_1C1B0F224();
  v6 = v5;
  v7 = self;
  v8 = (void *)Library.collection(identifier:)(v4, v6);

  swift_bridgeObjectRelease();
  return v8;
}

- (id)indexOfShortcutWithIdentifier:(id)a3 inCollectionWithIdentifier:(id)a4 error:(id *)a5
{
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  WFLibrary *v13;
  Swift::String v14;
  Swift::String v15;
  NSNumber v16;
  NSNumber v17;
  void *v18;
  id v19;

  v7 = sub_1C1B0F224();
  v9 = v8;
  v10 = sub_1C1B0F224();
  v12 = v11;
  v13 = self;
  v14._countAndFlagsBits = v7;
  v14._object = v9;
  v15._countAndFlagsBits = v10;
  v15._object = v12;
  v16.super.super.isa = Library.indexOfShortcut(identifier:inCollectionWithIdentifier:)(v14, v15).super.super.isa;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  if (v17.super.super.isa)
  {
    if (a5)
    {
      v18 = (void *)sub_1C1B0DBA4();

      v19 = v18;
      v16.super.super.isa = 0;
      *a5 = v18;
    }
    else
    {

      v16.super.super.isa = 0;
    }
  }
  return v16.super.super.isa;
}

- (BOOL)setShortcutOrdering:(id)a3 forCollectionIdentifier:(id)a4 error:(id *)a5
{
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  WFLibrary *v11;
  Swift::String v12;
  void *v13;
  void *v14;
  id v15;

  v7 = sub_1C1B0F380();
  v8 = sub_1C1B0F224();
  v10 = v9;
  v11 = self;
  v12._countAndFlagsBits = v8;
  v12._object = v10;
  Library.setShortcutOrdering(_:forCollectionIdentifier:)((Swift::OpaquePointer)v7, v12);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  if (v13)
  {
    if (a5)
    {
      v14 = (void *)sub_1C1B0DBA4();

      v15 = v14;
      *a5 = v14;
    }
    else
    {

    }
  }
  return v13 == 0;
}

- (NSString)version
{
  return (NSString *)sub_1C16C1750((uint64_t)self, (uint64_t)a2, (void (*)(void))Library.version.getter);
}

- (NSString)identifier
{
  return (NSString *)sub_1C16C1750((uint64_t)self, (uint64_t)a2, (void (*)(void))Library.identifier.getter);
}

- (WFLibrary)initWithIdentifier:(id)a3 version:(id)a4 data:(id)a5
{
  id v6;

  sub_1C1B0F224();
  sub_1C1B0F224();
  v6 = a5;
  sub_1C1B0DC4C();

  return (WFLibrary *)Library.init(identifier:version:data:)();
}

- (WFLibrary)initWithIdentifier:(id)a3 version:(id)a4
{
  sub_1C1B0F224();
  sub_1C1B0F224();
  return (WFLibrary *)Library.init(identifier:version:)();
}

- (id)capsuleDataWithError:(id *)a3
{
  WFLibrary *v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  void *v7;

  v3 = self;
  v4 = sub_1C16C1AE4();
  v6 = v5;

  v7 = (void *)sub_1C1B0DC40();
  sub_1C1604A74(v4, v6);
  return v7;
}

- (BOOL)mergeWithOther:(id)a3 error:(id *)a4
{
  id v5;
  WFLibrary *v6;

  v5 = a3;
  v6 = self;
  sub_1C16C1BE8(v5);

  return 1;
}

+ (void)performWithoutNotifyingObservers:(id)a3 error:(id *)a4
{
  void *v5;
  _QWORD v6[4];

  v5 = _Block_copy(a3);
  v6[2] = v5;
  sub_1C16C1CEC((uint64_t)sub_1C16C35BC, (uint64_t)v6, a4);
  _Block_release(v5);
}

- (WFLibrary)init
{
  Library.init()();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_9_16();
}

- (NSArray)folders
{
  WFLibrary *v2;
  void *v3;

  v2 = self;
  Library.folders.getter();

  sub_1C17600D0();
  v3 = (void *)sub_1C1B0F374();
  swift_bridgeObjectRelease();
  return (NSArray *)v3;
}

- (id)folderWithName:(id)a3 tombstoned:(BOOL)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  WFLibrary *v9;
  void *v10;
  void *v11;

  v6 = sub_1C1B0F224();
  v8 = v7;
  v9 = self;
  Library.folderWithName(_:tombstoned:)(v6, v8, a4);
  v11 = v10;

  swift_bridgeObjectRelease();
  return v11;
}

- (id)insertFolderWithName:(id)a3 icon:(unsigned __int16)a4 identifier:(id)a5 error:(id *)a6
{
  WFLibrary *v7;
  void *v8;
  void *v9;

  sub_1C1B0F224();
  sub_1C1B0F224();
  v7 = self;
  Library.insertFolder(name:icon:identifier:)();
  v9 = v8;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return v9;
}

- (BOOL)deleteFolderWithIdentifier:(id)a3 error:(id *)a4
{
  return sub_1C175F57C();
}

- (id)updateFolderWithIdentifier:(id)a3 newName:(id)a4 newIcon:(unsigned __int16)a5 error:(id *)a6
{
  WFLibrary *v7;
  void *v8;
  void *v9;

  sub_1C1B0F224();
  sub_1C1B0F224();
  v7 = self;
  Library.update(folderWithIdentifier:newName:newIcon:)();
  v9 = v8;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return v9;
}

- (BOOL)appendShortcutWithIdentifier:(id)a3 toFolder:(id)a4 error:(id *)a5
{
  return sub_1C175F008(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (uint64_t)a5, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))Library.appendShortcut(identifier:toFolder:));
}

- (BOOL)moveShortcutWithIdentifier:(id)a3 toFolder:(id)a4 error:(id *)a5
{
  return sub_1C175F008(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (uint64_t)a5, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))Library.moveShortcut(identifier:toFolder:));
}

- (BOOL)moveShortcutWithIdentifier:(id)a3 toIndex:(int64_t)a4 ofFolderWithIdentifier:(id)a5 error:(id *)a6
{
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  WFLibrary *v15;
  Swift::String v16;
  Swift::String v17;
  void *v18;
  void *v19;
  id v20;

  v9 = sub_1C1B0F224();
  v11 = v10;
  v12 = sub_1C1B0F224();
  v14 = v13;
  v15 = self;
  v16._countAndFlagsBits = v9;
  v16._object = v11;
  v17._countAndFlagsBits = v12;
  v17._object = v14;
  Library.moveShortcut(identifier:toIndex:ofFolderWithIdentifier:)(v16, a4, v17);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  if (v18)
  {
    if (a6)
    {
      v19 = (void *)sub_1C1B0DBA4();

      v20 = v19;
      *a6 = v19;
    }
    else
    {

    }
  }
  return v18 == 0;
}

- (BOOL)setShortcutOrdering:(id)a3 forFolderIdentifier:(id)a4 error:(id *)a5
{
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  WFLibrary *v11;
  Swift::String v12;
  void *v13;
  void *v14;
  id v15;

  v7 = sub_1C1B0F380();
  v8 = sub_1C1B0F224();
  v10 = v9;
  v11 = self;
  v12._countAndFlagsBits = v8;
  v12._object = v10;
  Library.setShortcutOrdering(_:forFolderIdentifier:)((Swift::OpaquePointer)v7, v12);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  if (v13)
  {
    if (a5)
    {
      v14 = (void *)sub_1C1B0DBA4();

      v15 = v14;
      *a5 = v14;
    }
    else
    {

    }
  }
  return v13 == 0;
}

- (BOOL)tombstoneFolderWithIdentifier:(id)a3 error:(id *)a4
{
  return sub_1C175F57C();
}

- (id)shortcutsInFolderWithIdentifier:(id)a3 error:(id *)a4
{
  WFLibrary *v5;
  void *v6;

  sub_1C1B0F224();
  v5 = self;
  Library.shortcuts(inFolderWithIdentifier:)();
  swift_bridgeObjectRelease();

  v6 = (void *)sub_1C1B0F374();
  swift_bridgeObjectRelease();
  return v6;
}

- (id)folderContainingShortcut:(id)a3 error:(id *)a4
{
  return sub_1C175F9FC();
}

- (id)folderWithIdentifier:(id)a3 error:(id *)a4
{
  return sub_1C175F9FC();
}

- (BOOL)moveFolders:(id)a3 toIndexes:(id)a4 error:(id *)a5
{
  uint64_t v8;
  NSIndexSet *v9;
  WFLibrary *v10;
  void *v11;
  void *v12;
  id v13;

  sub_1C17600D0();
  v8 = sub_1C1B0F380();
  v9 = (NSIndexSet *)a4;
  v10 = self;
  Library.moveFolders(_:toIndexes:)((Swift::OpaquePointer)v8, v9);
  swift_bridgeObjectRelease();

  if (v11)
  {
    if (a5)
    {
      v12 = (void *)sub_1C1B0DBA4();

      v13 = v12;
      *a5 = v12;
    }
    else
    {

    }
  }
  return v11 == 0;
}

- (id)indexOfShortcutWithShortcut:(id)a3 folderIdentifier:(id)a4 error:(id *)a5
{
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  WFLibrary *v13;
  Swift::String v14;
  Swift::String v15;
  NSNumber v16;
  NSNumber v17;
  void *v18;
  id v19;

  v7 = sub_1C1B0F224();
  v9 = v8;
  v10 = sub_1C1B0F224();
  v12 = v11;
  v13 = self;
  v14._countAndFlagsBits = v7;
  v14._object = v9;
  v15._countAndFlagsBits = v10;
  v15._object = v12;
  v16.super.super.isa = Library.indexOfShortcut(shortcut:folderIdentifier:)(v14, v15).super.super.isa;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  if (v17.super.super.isa)
  {
    if (a5)
    {
      v18 = (void *)sub_1C1B0DBA4();

      v19 = v18;
      v16.super.super.isa = 0;
      *a5 = v18;
    }
    else
    {

      v16.super.super.isa = 0;
    }
  }
  return v16.super.super.isa;
}

- (NSArray)shortcutIdentifiers
{
  WFLibrary *v2;
  void *v3;

  v2 = self;
  Library.shortcutIdentifiers.getter();

  v3 = (void *)sub_1C1B0F374();
  swift_bridgeObjectRelease();
  return (NSArray *)v3;
}

- (void)prependShortcutWithId:(id)a3
{
  sub_1C1872550(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t, uint64_t))Library.prependShortcut(id:));
}

- (void)insertShortcutWithId:(id)a3
{
  sub_1C1872550(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t, uint64_t))Library.insertShortcut(id:));
}

- (BOOL)removeShortcutWithIdentifier:(id)a3 error:(id *)a4
{
  uint64_t v6;
  void *v7;
  void *v8;
  WFLibrary *v9;
  Swift::String v10;
  void *v11;
  void *v12;
  id v13;

  v6 = sub_1C1B0F224();
  v8 = v7;
  v9 = self;
  v10._countAndFlagsBits = v6;
  v10._object = v8;
  Library.remove(shortcutWithIdentifier:)(v10);
  swift_bridgeObjectRelease();

  if (v11)
  {
    if (a4)
    {
      v12 = (void *)sub_1C1B0DBA4();

      v13 = v12;
      *a4 = v12;
    }
    else
    {

    }
  }
  return v11 == 0;
}

- (id)shortcutIdentifiersWithQuery:(id)a3 error:(id *)a4
{
  id v5;
  WFLibrary *v6;
  void *v7;

  v5 = a3;
  v6 = self;
  Library.shortcutIdentifiers(query:)(v5);

  v7 = (void *)sub_1C1B0F374();
  swift_bridgeObjectRelease();
  return v7;
}

@end
