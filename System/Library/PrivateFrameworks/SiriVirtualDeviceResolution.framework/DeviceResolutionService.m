@implementation DeviceResolutionService

- (_TtC27SiriVirtualDeviceResolution23DeviceResolutionService)init
{
  return (_TtC27SiriVirtualDeviceResolution23DeviceResolutionService *)sub_1C2EDE800();
}

- (void)homeManagerDidUpdateHomes:(id)a3
{
  id v4;
  _TtC27SiriVirtualDeviceResolution23DeviceResolutionService *v5;

  v4 = a3;
  v5 = self;
  sub_1C2EE9DD4();

}

- (void)homeManagerDidUpdateDataSyncInProgress:(id)a3
{
  id v4;
  _TtC27SiriVirtualDeviceResolution23DeviceResolutionService *v5;

  v4 = a3;
  v5 = self;
  sub_1C2EE9F20();

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC27SiriVirtualDeviceResolution23DeviceResolutionService_homeManagerReadyGroup));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC27SiriVirtualDeviceResolution23DeviceResolutionService_queue));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC27SiriVirtualDeviceResolution23DeviceResolutionService_homeManager));
  sub_1C2EED7B8((uint64_t)self + OBJC_IVAR____TtC27SiriVirtualDeviceResolution23DeviceResolutionService_endpointUUID, &qword_1EF7D39E8);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC27SiriVirtualDeviceResolution23DeviceResolutionService__xpcConnection));
}

@end
