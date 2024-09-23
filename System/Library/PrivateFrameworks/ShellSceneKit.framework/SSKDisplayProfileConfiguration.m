@implementation SSKDisplayProfileConfiguration

- (BOOL)supportsCloning
{
  return self->configuration[OBJC_IVAR___SSKDisplayProfileConfiguration_configuration + 25];
}

- (NSString)derivedIdentifier
{
  void *v2;

  if (*(_QWORD *)&self->configuration[OBJC_IVAR___SSKDisplayProfileConfiguration_configuration + 16])
  {
    swift_bridgeObjectRetain();
    v2 = (void *)sub_246017CF8();
    swift_bridgeObjectRelease();
  }
  else
  {
    v2 = 0;
  }
  return (NSString *)v2;
}

- (BOOL)isMainLike
{
  if (*(_QWORD *)&self->configuration[OBJC_IVAR___SSKDisplayProfileConfiguration_configuration + 16])
    return self->configuration[OBJC_IVAR___SSKDisplayProfileConfiguration_configuration + 24] & 1;
  else
    return 0;
}

- (unint64_t)priority
{
  return *(unint64_t *)((char *)&self->super.isa + OBJC_IVAR___SSKDisplayProfileConfiguration_configuration);
}

- (SSKDisplayProfileConfiguration)init
{
  SSKDisplayProfileConfiguration *result;

  result = (SSKDisplayProfileConfiguration *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)transformPhysicalDisplayWith:(id)a3
{
  SSKDisplayProfileConfiguration *v5;

  swift_unknownObjectRetain();
  v5 = self;
  DisplayProfileConfiguration_Box.transformPhysicalDisplay(with:)(a3);
  swift_unknownObjectRelease();

}

- (BOOL)derivesDisplays
{
  return *(_QWORD *)&self->configuration[OBJC_IVAR___SSKDisplayProfileConfiguration_configuration + 16] != 0;
}

- (BOOL)shouldTransformConnectingDisplays
{
  return (*(_QWORD *)&self->configuration[OBJC_IVAR___SSKDisplayProfileConfiguration_configuration + 16] != 0) | self->configuration[OBJC_IVAR___SSKDisplayProfileConfiguration_configuration + 25] & 1;
}

@end
