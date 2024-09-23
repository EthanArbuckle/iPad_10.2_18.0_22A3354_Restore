@implementation OpenCVWrapperCVBufferLock

- (void)dealloc
{
  objc_class *ObjectType;
  __CVBuffer *v4;
  CVPixelBufferLockFlags v5;
  _TtC7Measure25OpenCVWrapperCVBufferLock *v6;
  Swift::Int32 v7;
  Swift::String v8;
  objc_super v9;

  ObjectType = (objc_class *)swift_getObjectType(self);
  v4 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC7Measure25OpenCVWrapperCVBufferLock_buffer);
  v5 = *(CVPixelBufferLockFlags *)((char *)&self->super.super.isa
                                 + OBJC_IVAR____TtC7Measure25OpenCVWrapperCVBufferLock_lockFlags);
  v6 = self;
  v7 = CVPixelBufferUnlockBaseAddress(v4, v5);
  v8._object = (void *)0x80000001003E0FB0;
  v8._countAndFlagsBits = 0xD00000000000001ELL;
  logCVError(_:label:)(v7, v8);
  v9.receiver = v6;
  v9.super_class = ObjectType;
  -[OpenCVWrapperCVBufferLock dealloc](&v9, "dealloc");
}

- (void).cxx_destruct
{

}

- (id)initInternal
{
  id result;

  result = (id)_swift_stdlib_reportUnimplementedInitializer("Measure.OpenCVWrapperCVBufferLock", 33, "init(internal:)", 15, 0);
  __break(1u);
  return result;
}

@end
