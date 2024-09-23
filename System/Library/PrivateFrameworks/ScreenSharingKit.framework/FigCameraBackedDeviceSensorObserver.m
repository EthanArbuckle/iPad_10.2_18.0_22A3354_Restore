@implementation FigCameraBackedDeviceSensorObserver

- (void)dealloc
{
  void *v2;
  _TtC16ScreenSharingKit35FigCameraBackedDeviceSensorObserver *v3;
  objc_super v4;

  v2 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC16ScreenSharingKit35FigCameraBackedDeviceSensorObserver_cameraViewfinder);
  v3 = self;
  objc_msgSend(v2, sel_stop);
  v4.receiver = v3;
  v4.super_class = (Class)type metadata accessor for FigCameraBackedDeviceSensorObserver();
  -[FigCameraBackedDeviceSensorObserver dealloc](&v4, sel_dealloc);
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  v3 = (char *)self + OBJC_IVAR____TtC16ScreenSharingKit35FigCameraBackedDeviceSensorObserver__sensorsInUse;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2574B9848);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16ScreenSharingKit35FigCameraBackedDeviceSensorObserver_cameraViewfinderDelegateQueue));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16ScreenSharingKit35FigCameraBackedDeviceSensorObserver_cameraViewfinder));
}

- (_TtC16ScreenSharingKit35FigCameraBackedDeviceSensorObserver)init
{
  return (_TtC16ScreenSharingKit35FigCameraBackedDeviceSensorObserver *)sub_24587BC24();
}

- (void)cameraViewfinder:(id)a3 viewfinderSessionDidBegin:(id)a4
{
  id v6;
  id v7;
  _TtC16ScreenSharingKit35FigCameraBackedDeviceSensorObserver *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_24587C2D8(a4);

}

- (void)cameraViewfinder:(id)a3 viewfinderSessionDidEnd:(id)a4
{
  id v6;
  id v7;
  _TtC16ScreenSharingKit35FigCameraBackedDeviceSensorObserver *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_24587C608(a4);

}

@end
