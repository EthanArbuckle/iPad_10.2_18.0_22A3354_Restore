@implementation VideoCaptureSession

- (void)dealloc
{
  uint64_t v2;

  sub_1B1BAE77C((char *)self, (uint64_t)a2, &OBJC_IVAR____TtC3VFX19VideoCaptureSession_session, (SEL *)&selRef_stopRunning, v2, (uint64_t (*)(uint64_t))type metadata accessor for VideoCaptureSession);
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();

}

- (_TtC3VFX19VideoCaptureSession)init
{
  _TtC3VFX19VideoCaptureSession *result;

  result = (_TtC3VFX19VideoCaptureSession *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void)captureOutput:(id)a3 didOutputSampleBuffer:(opaqueCMSampleBuffer *)a4 fromConnection:(id)a5
{
  id v8;
  opaqueCMSampleBuffer *v9;
  id v10;
  void *v11;
  _TtC3VFX19VideoCaptureSession *v12;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v12 = self;
  v11 = (void *)MEMORY[0x1B5E22F20]();
  sub_1B1BABD60((uint64_t)v8, v9, (uint64_t)v12);
  objc_autoreleasePoolPop(v11);

}

@end
