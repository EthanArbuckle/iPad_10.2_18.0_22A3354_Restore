@implementation VariablePillDrawer

- (_TtC14WorkflowUICore18VariablePillDrawer)init
{
  return (_TtC14WorkflowUICore18VariablePillDrawer *)sub_2270F0900();
}

+ (id)drawVariableNamed:(id)a3 icon:(id)a4 font:(id)a5 tint:(id)a6 size:(CGSize)a7 state:(unint64_t)a8 isAvailable:(BOOL)a9
{
  double height;
  double width;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  id v20;
  id v21;
  id v22;

  height = a7.height;
  width = a7.width;
  v16 = sub_227101370();
  v18 = v17;
  v19 = a4;
  v20 = a5;
  v21 = a6;
  v22 = static VariablePillDrawer.draw(name:icon:font:tint:size:state:isAvailable:)(width, height, v16, v18, a4, v20, v21, a8, a9);

  swift_bridgeObjectRelease();
  return v22;
}

+ (void)drawVariableForAppIconNamed:(id)a3 appIcon:(id)a4 font:(id)a5 tint:(id)a6 size:(CGSize)a7 state:(unint64_t)a8 isAvailable:(BOOL)a9 completionBlock:(id)aBlock
{
  double height;
  double width;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t ObjCClassMetadata;
  id v22;
  id v23;
  id v24;

  height = a7.height;
  width = a7.width;
  v17 = _Block_copy(aBlock);
  v18 = sub_227101370();
  v20 = v19;
  ObjCClassMetadata = swift_getObjCClassMetadata();
  _Block_copy(v17);
  v22 = a4;
  v23 = a5;
  v24 = a6;
  sub_2270F0C38(v18, v20, v22, v23, v24, a8, a9, ObjCClassMetadata, width, height, (void (**)(_QWORD, _QWORD))v17);
  _Block_release(v17);

  swift_bridgeObjectRelease();
}

@end
