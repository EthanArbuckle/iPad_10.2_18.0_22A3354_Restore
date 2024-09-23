@implementation PopoverSearchBar.Coordinator

- (void)searchBar:(id)a3 textDidChange:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t, uint64_t);
  id v11;
  _TtCV5BooksP33_86D993C5768548B01F8EDC3BAEFB8CB116PopoverSearchBar11Coordinator *v12;

  v6 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v8 = v7;
  v10 = *(void (**)(uint64_t, uint64_t))((char *)&self->super.isa
                                                + OBJC_IVAR____TtCV5BooksP33_86D993C5768548B01F8EDC3BAEFB8CB116PopoverSearchBar11Coordinator_textDidChange);
  v9 = *(_QWORD *)&self->textDidChange[OBJC_IVAR____TtCV5BooksP33_86D993C5768548B01F8EDC3BAEFB8CB116PopoverSearchBar11Coordinator_textDidChange];
  v11 = a3;
  v12 = self;
  swift_retain(v9);
  v10(v6, v8);

  swift_bridgeObjectRelease(v8);
  swift_release(v9);
}

- (void)searchBarSearchButtonClicked:(id)a3
{
  uint64_t v4;
  void (*v5)(uint64_t);
  id v6;
  _TtCV5BooksP33_86D993C5768548B01F8EDC3BAEFB8CB116PopoverSearchBar11Coordinator *v7;
  uint64_t v8;

  v5 = *(void (**)(uint64_t))((char *)&self->super.isa
                                      + OBJC_IVAR____TtCV5BooksP33_86D993C5768548B01F8EDC3BAEFB8CB116PopoverSearchBar11Coordinator_searchButtonClicked);
  v4 = *(_QWORD *)&self->textDidChange[OBJC_IVAR____TtCV5BooksP33_86D993C5768548B01F8EDC3BAEFB8CB116PopoverSearchBar11Coordinator_searchButtonClicked];
  v6 = a3;
  v7 = self;
  v8 = swift_retain(v4);
  v5(v8);

  swift_release(v4);
}

- (_TtCV5BooksP33_86D993C5768548B01F8EDC3BAEFB8CB116PopoverSearchBar11Coordinator)init
{
  objc_class *ObjectType;
  Swift::Void (__swiftcall **v4)();
  Swift::Void (__swiftcall **v5)();
  objc_super v7;

  ObjectType = (objc_class *)swift_getObjectType();
  v4 = (Swift::Void (__swiftcall **)())((char *)self
                                      + OBJC_IVAR____TtCV5BooksP33_86D993C5768548B01F8EDC3BAEFB8CB116PopoverSearchBar11Coordinator_textDidChange);
  *v4 = BKAppDelegate.enableMetricsInspectorOnDebugMode();
  v4[1] = 0;
  v5 = (Swift::Void (__swiftcall **)())((char *)self
                                      + OBJC_IVAR____TtCV5BooksP33_86D993C5768548B01F8EDC3BAEFB8CB116PopoverSearchBar11Coordinator_searchButtonClicked);
  *v5 = BKAppDelegate.enableMetricsInspectorOnDebugMode();
  v5[1] = 0;
  v7.receiver = self;
  v7.super_class = ObjectType;
  return -[PopoverSearchBar.Coordinator init](&v7, "init");
}

- (void).cxx_destruct
{
  swift_release(*(_QWORD *)&self->textDidChange[OBJC_IVAR____TtCV5BooksP33_86D993C5768548B01F8EDC3BAEFB8CB116PopoverSearchBar11Coordinator_textDidChange]);
  swift_release(*(_QWORD *)&self->textDidChange[OBJC_IVAR____TtCV5BooksP33_86D993C5768548B01F8EDC3BAEFB8CB116PopoverSearchBar11Coordinator_searchButtonClicked]);
}

@end
