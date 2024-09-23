@implementation MapView.Coordinator

- (void)mapViewDidChangeVisibleRegion:(id)a3
{
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  id v9;
  _TtCV15SafetyMonitorUI7MapView11Coordinator *v10;
  _OWORD v11[10];
  uint64_t v12;

  v4 = *(_OWORD *)&self->parent[OBJC_IVAR____TtCV15SafetyMonitorUI7MapView11Coordinator_parent + 128];
  v11[8] = *(_OWORD *)&self->parent[OBJC_IVAR____TtCV15SafetyMonitorUI7MapView11Coordinator_parent + 112];
  v11[9] = v4;
  v12 = *(_QWORD *)&self->parent[OBJC_IVAR____TtCV15SafetyMonitorUI7MapView11Coordinator_parent + 144];
  v5 = *(_OWORD *)&self->parent[OBJC_IVAR____TtCV15SafetyMonitorUI7MapView11Coordinator_parent + 64];
  v11[4] = *(_OWORD *)&self->parent[OBJC_IVAR____TtCV15SafetyMonitorUI7MapView11Coordinator_parent + 48];
  v11[5] = v5;
  v6 = *(_OWORD *)&self->parent[OBJC_IVAR____TtCV15SafetyMonitorUI7MapView11Coordinator_parent + 96];
  v11[6] = *(_OWORD *)&self->parent[OBJC_IVAR____TtCV15SafetyMonitorUI7MapView11Coordinator_parent + 80];
  v11[7] = v6;
  v7 = *(_OWORD *)&self->parent[OBJC_IVAR____TtCV15SafetyMonitorUI7MapView11Coordinator_parent];
  v11[0] = *(_OWORD *)((char *)&self->super.isa + OBJC_IVAR____TtCV15SafetyMonitorUI7MapView11Coordinator_parent);
  v11[1] = v7;
  v8 = *(_OWORD *)&self->parent[OBJC_IVAR____TtCV15SafetyMonitorUI7MapView11Coordinator_parent + 32];
  v11[2] = *(_OWORD *)&self->parent[OBJC_IVAR____TtCV15SafetyMonitorUI7MapView11Coordinator_parent + 16];
  v11[3] = v8;
  v9 = a3;
  v10 = self;
  sub_24562521C((uint64_t)v11);
  objc_msgSend(v9, sel_region);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25748B708);
  sub_2456FA618();
  sub_2456253F8((uint64_t)v11);

}

- (id)mapView:(id)a3 rendererForOverlay:(id)a4
{
  id v6;
  _TtCV15SafetyMonitorUI7MapView11Coordinator *v7;
  id v8;

  v6 = a3;
  swift_unknownObjectRetain();
  v7 = self;
  v8 = sub_2456254D4((uint64_t)a4);

  swift_unknownObjectRelease();
  return v8;
}

- (id)mapView:(id)a3 viewForAnnotation:(id)a4
{
  id v6;
  _TtCV15SafetyMonitorUI7MapView11Coordinator *v7;
  id v8;

  v6 = a3;
  swift_unknownObjectRetain();
  v7 = self;
  v8 = sub_2456255E0(v6, (uint64_t)a4);

  swift_unknownObjectRelease();
  return v8;
}

- (void)mapView:(id)a3 didAddAnnotationViews:(id)a4
{
  unint64_t v6;
  id v7;
  _TtCV15SafetyMonitorUI7MapView11Coordinator *v8;

  sub_245600F90(0, (unint64_t *)&unk_25748B7F0);
  v6 = sub_2456FA8DC();
  v7 = a3;
  v8 = self;
  sub_245625734(v7, v6);

  swift_bridgeObjectRelease();
}

- (void)mapView:(id)a3 annotationView:(id)a4 didChangeDragState:(unint64_t)a5 fromOldState:(unint64_t)a6
{
  id v9;
  _TtCV15SafetyMonitorUI7MapView11Coordinator *v10;
  id v11;

  v11 = a3;
  v9 = a4;
  v10 = self;
  sub_245625870(v11, v9, a5);

}

- (void)longPressActionWithSender:(id)a3
{
  _TtCV15SafetyMonitorUI7MapView11Coordinator *v4;
  id v5;

  v5 = a3;
  v4 = self;
  sub_2456235DC(v5);

}

- (_TtCV15SafetyMonitorUI7MapView11Coordinator)init
{
  _TtCV15SafetyMonitorUI7MapView11Coordinator *result;

  result = (_TtCV15SafetyMonitorUI7MapView11Coordinator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  _OWORD v8[10];
  uint64_t v9;

  swift_release();
  v3 = *(_OWORD *)&self->parent[OBJC_IVAR____TtCV15SafetyMonitorUI7MapView11Coordinator_parent + 128];
  v8[8] = *(_OWORD *)&self->parent[OBJC_IVAR____TtCV15SafetyMonitorUI7MapView11Coordinator_parent + 112];
  v8[9] = v3;
  v9 = *(_QWORD *)&self->parent[OBJC_IVAR____TtCV15SafetyMonitorUI7MapView11Coordinator_parent + 144];
  v4 = *(_OWORD *)&self->parent[OBJC_IVAR____TtCV15SafetyMonitorUI7MapView11Coordinator_parent + 64];
  v8[4] = *(_OWORD *)&self->parent[OBJC_IVAR____TtCV15SafetyMonitorUI7MapView11Coordinator_parent + 48];
  v8[5] = v4;
  v5 = *(_OWORD *)&self->parent[OBJC_IVAR____TtCV15SafetyMonitorUI7MapView11Coordinator_parent + 96];
  v8[6] = *(_OWORD *)&self->parent[OBJC_IVAR____TtCV15SafetyMonitorUI7MapView11Coordinator_parent + 80];
  v8[7] = v5;
  v6 = *(_OWORD *)&self->parent[OBJC_IVAR____TtCV15SafetyMonitorUI7MapView11Coordinator_parent];
  v8[0] = *(_OWORD *)((char *)&self->super.isa + OBJC_IVAR____TtCV15SafetyMonitorUI7MapView11Coordinator_parent);
  v8[1] = v6;
  v7 = *(_OWORD *)&self->parent[OBJC_IVAR____TtCV15SafetyMonitorUI7MapView11Coordinator_parent + 32];
  v8[2] = *(_OWORD *)&self->parent[OBJC_IVAR____TtCV15SafetyMonitorUI7MapView11Coordinator_parent + 16];
  v8[3] = v7;
  sub_2456253F8((uint64_t)v8);
}

@end
