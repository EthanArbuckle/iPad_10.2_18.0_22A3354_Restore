@implementation PhotosDynamicHeaderLayoutProvider

- (id)createGlobalHeaderLayoutForPhotosViewModel:(id)a3 dataSource:(id)a4 spec:(id)a5
{
  id v8;
  id v9;
  id v10;
  _TtC12PhotosUICore33PhotosDynamicHeaderLayoutProvider *v11;
  _QWORD *v12;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = self;
  v12 = sub_1A6D804D4(v8, v9, v10);

  return v12;
}

- (void)configureGlobalHeaderLayout:(id)a3 dataSource:(id)a4 spec:(id)a5
{
  _QWORD *v9;
  _QWORD *v10;
  _QWORD *v11;
  void (*v12)(id);
  id v13;
  id v14;
  id v15;
  void (*v16)(void);
  id v17;
  _TtC12PhotosUICore33PhotosDynamicHeaderLayoutProvider *v18;

  type metadata accessor for PhotosDynamicHeaderLayout();
  v9 = (_QWORD *)swift_dynamicCastClass();
  if (v9)
  {
    v10 = v9;
    v11 = (_QWORD *)MEMORY[0x1E0DEEDD8];
    v12 = *(void (**)(id))((*v9 & *MEMORY[0x1E0DEEDD8]) + 0xB8);
    v13 = a4;
    v14 = a3;
    v15 = a5;
    v18 = self;
    v12(a4);
    v16 = *(void (**)(void))((*v11 & *v10) + 0xD0);
    v17 = v15;
    v16();

  }
}

- (_TtC12PhotosUICore33PhotosDynamicHeaderLayoutProvider)init
{
  _TtC12PhotosUICore33PhotosDynamicHeaderLayoutProvider *result;

  result = (_TtC12PhotosUICore33PhotosDynamicHeaderLayoutProvider *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
