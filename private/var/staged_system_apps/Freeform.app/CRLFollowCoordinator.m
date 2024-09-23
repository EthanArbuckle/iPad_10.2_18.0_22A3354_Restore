@implementation CRLFollowCoordinator

- (BOOL)isFollowing
{
  _TtC8Freeform20CRLFollowCoordinator *v2;
  char v3;

  v2 = self;
  v3 = sub_1006F2CE0();

  return v3 & 1;
}

- (_TtC8Freeform27CRLCollaborationParticipant)followingParticipant
{
  uint64_t KeyPath;
  uint64_t v4;
  _TtC8Freeform20CRLFollowCoordinator *v5;
  id v7;

  KeyPath = swift_getKeyPath(&unk_100F06958);
  v4 = swift_getKeyPath(&unk_100F06980);
  v5 = self;
  static Published.subscript.getter(&v7, v5, KeyPath, v4);

  swift_release(KeyPath);
  swift_release(v4);
  return (_TtC8Freeform27CRLCollaborationParticipant *)v7;
}

- (void)setFollowingParticipant:(id)a3
{
  uint64_t KeyPath;
  uint64_t v6;
  id v7;
  id v8;

  KeyPath = swift_getKeyPath(&unk_100F06958);
  v6 = swift_getKeyPath(&unk_100F06980);
  v8 = a3;
  v7 = a3;
  static Published.subscript.setter(&v8, self, KeyPath, v6);
}

- (_TtC8Freeform27CRLCollaborationParticipant)localParticipant
{
  _TtC8Freeform20CRLFollowCoordinator *v2;
  char *v3;

  v2 = self;
  v3 = sub_1006F2F24();

  return (_TtC8Freeform27CRLCollaborationParticipant *)v3;
}

- (NSSet)participantsFollowingLocalParticipant
{
  _TtC8Freeform20CRLFollowCoordinator *v2;
  void *v3;
  Class isa;

  v2 = self;
  v3 = sub_1006F3134();

  type metadata accessor for CRLCollaborationParticipant(0);
  sub_1004B7878((unint64_t *)&unk_1013E8E30, type metadata accessor for CRLCollaborationParticipant, (uint64_t)&protocol conformance descriptor for NSObject);
  isa = Set._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v3);
  return (NSSet *)isa;
}

- (NSUUID)expectingViewportFromUUID
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  Class isa;
  _BYTE v12[24];

  v3 = sub_1004B804C((uint64_t *)&unk_1013E1A50);
  __chkstk_darwin(v3);
  v5 = &v12[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  v6 = (char *)self + OBJC_IVAR____TtC8Freeform20CRLFollowCoordinator_expectingViewportFromUUID;
  swift_beginAccess(v6, v12, 0, 0);
  sub_1004CB7BC((uint64_t)v6, (uint64_t)v5, (uint64_t *)&unk_1013E1A50);
  v7 = type metadata accessor for UUID(0);
  v8 = *(_QWORD *)(v7 - 8);
  isa = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v5, 1, v7) != 1)
  {
    isa = UUID._bridgeToObjectiveC()().super.isa;
    (*(void (**)(char *, uint64_t))(v8 + 8))(v5, v7);
  }
  return (NSUUID *)isa;
}

- (void)setExpectingViewportFromUUID:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  _BYTE *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  _TtC8Freeform20CRLFollowCoordinator *v11;
  _BYTE v13[24];

  v5 = sub_1004B804C((uint64_t *)&unk_1013E1A50);
  __chkstk_darwin(v5);
  v7 = &v13[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  if (a3)
  {
    static UUID._unconditionallyBridgeFromObjectiveC(_:)(a3);
    v8 = type metadata accessor for UUID(0);
    (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56))(v7, 0, 1, v8);
  }
  else
  {
    v9 = type metadata accessor for UUID(0);
    (*(void (**)(_BYTE *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 56))(v7, 1, 1, v9);
  }
  v10 = (char *)self + OBJC_IVAR____TtC8Freeform20CRLFollowCoordinator_expectingViewportFromUUID;
  swift_beginAccess((char *)self + OBJC_IVAR____TtC8Freeform20CRLFollowCoordinator_expectingViewportFromUUID, v13, 33, 0);
  v11 = self;
  sub_100582338((uint64_t)v7, (uint64_t)v10, (uint64_t *)&unk_1013E1A50);
  swift_endAccess(v13);

}

- (unint64_t)latestViewportUpdateTimestamp
{
  return *(unint64_t *)((char *)&self->super.isa
                             + OBJC_IVAR____TtC8Freeform20CRLFollowCoordinator_latestViewportUpdateTimestamp);
}

- (void)setLatestViewportUpdateTimestamp:(unint64_t)a3
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform20CRLFollowCoordinator_latestViewportUpdateTimestamp) = (Class)a3;
}

- (void)dealloc
{
  void *v3;
  _TtC8Freeform20CRLFollowCoordinator *v4;
  objc_super v5;

  v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC8Freeform20CRLFollowCoordinator_followingParticipantsStartEndFollowTimer);
  v4 = self;
  if (v3)
    objc_msgSend(v3, "invalidate");
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for CRLFollowCoordinator(0);
  -[CRLFollowCoordinator dealloc](&v5, "dealloc");
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  sub_1004CBB0C((uint64_t)self + OBJC_IVAR____TtC8Freeform20CRLFollowCoordinator_delegate);

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC8Freeform20CRLFollowCoordinator_interactiveCanvasControllers));
  sub_1004CB800((uint64_t)self + OBJC_IVAR____TtC8Freeform20CRLFollowCoordinator_viewportToSend, &qword_1013EE2E0);
  sub_1004CB800((uint64_t)self + OBJC_IVAR____TtC8Freeform20CRLFollowCoordinator_viewportToApply, &qword_1013EE2E0);
  v3 = (char *)self + OBJC_IVAR____TtC8Freeform20CRLFollowCoordinator__followingParticipant;
  v4 = sub_1004B804C(&qword_1013EE318);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC8Freeform20CRLFollowCoordinator_unconfirmedFollowingParticipant));

  sub_1004CB800((uint64_t)self + OBJC_IVAR____TtC8Freeform20CRLFollowCoordinator_activeParticipantObserver, &qword_1013EE2F8);
  sub_1004CB800((uint64_t)self + OBJC_IVAR____TtC8Freeform20CRLFollowCoordinator_expectingViewportFromUUID, (uint64_t *)&unk_1013E1A50);
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC8Freeform20CRLFollowCoordinator_pendingFollowStartParticipants));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC8Freeform20CRLFollowCoordinator_pendingFollowEndParticipants));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC8Freeform20CRLFollowCoordinator_followingParticipantsStartEndFollowTimer));
  sub_1004CB800((uint64_t)self + OBJC_IVAR____TtC8Freeform20CRLFollowCoordinator_latestViewportUpdateInBatch, &qword_1013EE2E0);
  sub_1004CB800((uint64_t)self + OBJC_IVAR____TtC8Freeform20CRLFollowCoordinator_crlaxFollowFeatureLastScrollTimestamp, &qword_1013E04F0);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC8Freeform20CRLFollowCoordinator____lazy_storage___accessibilityExperienceCoordinator));
}

- (void)addInteractiveCanvasController:(id)a3
{
  void *v4;
  id v5;
  _TtC8Freeform20CRLFollowCoordinator *v6;

  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform20CRLFollowCoordinator_interactiveCanvasControllers);
  v5 = a3;
  v6 = self;
  if ((objc_msgSend(v4, "containsObject:", v5) & 1) == 0)
    objc_msgSend(v4, "addObject:", v5);

}

- (void)removeInteractiveCanvasController:(id)a3
{
  void *v4;
  id v5;
  _TtC8Freeform20CRLFollowCoordinator *v6;

  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform20CRLFollowCoordinator_interactiveCanvasControllers);
  v5 = a3;
  v6 = self;
  if (objc_msgSend(v4, "containsObject:", v5))
    objc_msgSend(v4, "removeObject:", v5);

}

- (void)addUIDelegate:(id)a3
{
  void *v5;
  _TtC8Freeform20CRLFollowCoordinator *v6;

  v5 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform20CRLFollowCoordinator_uiDelegates);
  swift_unknownObjectRetain(a3);
  v6 = self;
  if ((objc_msgSend(v5, "containsObject:", a3) & 1) == 0)
    objc_msgSend(v5, "addObject:", a3);
  swift_unknownObjectRelease(a3);

}

- (void)removeUIDelegate:(id)a3
{
  void *v5;
  _TtC8Freeform20CRLFollowCoordinator *v6;

  v5 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform20CRLFollowCoordinator_uiDelegates);
  swift_unknownObjectRetain(a3);
  v6 = self;
  if (objc_msgSend(v5, "containsObject:", a3))
    objc_msgSend(v5, "removeObject:", a3);
  swift_unknownObjectRelease(a3);

}

+ (BOOL)localUserIsFollowable
{
  return 1;
}

- (void)endFollowSessionForLocalParticipantWithShouldShowRefollowPlacard:(BOOL)a3
{
  _TtC8Freeform20CRLFollowCoordinator *v4;

  v4 = self;
  sub_1006F51D0(a3);

}

- (void)localParticipantWantsToStartFollowingCollaborator:(id)a3 isRefollow:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  _TtC8Freeform20CRLFollowCoordinator *v7;

  v4 = a4;
  v6 = a3;
  v7 = self;
  sub_1006F63B4(v6, v4);

}

- (void)localParticipantWantsToStartFollowingCollaborator:(id)a3
{
  id v4;
  _TtC8Freeform20CRLFollowCoordinator *v5;

  v4 = a3;
  v5 = self;
  sub_1006F63B4(v4, 0);

}

- (void)selectionPathDidChangeWithNotification:(id)a3
{
  id v4;
  _TtC8Freeform20CRLFollowCoordinator *v5;

  v4 = a3;
  v5 = self;
  sub_100701EF0();

}

- (void)deviceDidRotateWhileFollowingNotification:(id)a3
{
  id v4;
  _TtC8Freeform20CRLFollowCoordinator *v5;

  v4 = a3;
  v5 = self;
  sub_100702028();

}

- (void)canvasDidZoomOrScrollWhileFollowingNotification:(id)a3
{
  id v4;
  _TtC8Freeform20CRLFollowCoordinator *v5;

  v4 = a3;
  v5 = self;
  sub_1007020EC();

}

- (void)canvasUpdateScrollWhileHostingWithNotification:(id)a3
{
  sub_1006F99A0(self, (uint64_t)a2, a3, (uint64_t (*)(void))sub_1006F982C);
}

- (void)canvasUpdateZoomWhileHostingWithNotification:(id)a3
{
  sub_1006F99A0(self, (uint64_t)a2, a3, (uint64_t (*)(void))sub_1006F9844);
}

- (void)canvasDidScrollWhileHostingWithNotification:(void *)a3
{
  id v4;
  id v5;

  if (*((_BYTE *)a1 + OBJC_IVAR____TtC8Freeform20CRLFollowCoordinator_isFollowed) == 1)
  {
    v4 = a3;
    v5 = a1;
    sub_1006F9AB0(v4, 1);

  }
}

- (void)sendUpdateIfNeeded
{
  _TtC8Freeform20CRLFollowCoordinator *v2;

  if (*((_BYTE *)&self->super.isa + OBJC_IVAR____TtC8Freeform20CRLFollowCoordinator_isFollowed) == 1)
  {
    v2 = self;
    sub_1006F9DEC(0, 1);

  }
}

- (void)groupSessionPresenceWasAddedWithNotification:(id)a3
{
  id v4;
  _TtC8Freeform20CRLFollowCoordinator *v5;

  v4 = a3;
  v5 = self;
  sub_1006FC530(v4);

}

- (void)willProcessViewportUpdates
{
  _TtC8Freeform20CRLFollowCoordinator *v2;

  v2 = self;
  sub_1006FCB18();

}

- (void)didProcessViewportUpdates
{
  _TtC8Freeform20CRLFollowCoordinator *v2;

  v2 = self;
  sub_1006FCE9C();

}

- (void)setExpectingViewportForOneTimeScrollFrom:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  _BYTE *v7;
  uint64_t v8;
  uint64_t v9;
  _BYTE *v10;
  uint64_t v11;
  uint64_t v12;
  _BYTE *v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  _TtC8Freeform20CRLFollowCoordinator *v17;
  uint64_t v18;
  uint64_t v19;
  _BYTE v21[24];

  v5 = sub_1004B804C(&qword_1013EE2E0);
  __chkstk_darwin(v5);
  v7 = &v21[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  v8 = sub_1004B804C((uint64_t *)&unk_1013E1A50);
  __chkstk_darwin(v8);
  v10 = &v21[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  __chkstk_darwin(v11);
  v13 = &v21[-v12 - 8];
  if (a3)
  {
    static UUID._unconditionallyBridgeFromObjectiveC(_:)(a3);
    v14 = type metadata accessor for UUID(0);
    (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(v13, 0, 1, v14);
  }
  else
  {
    v15 = type metadata accessor for UUID(0);
    (*(void (**)(_BYTE *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 56))(v13, 1, 1, v15);
  }
  sub_1004CB7BC((uint64_t)v13, (uint64_t)v10, (uint64_t *)&unk_1013E1A50);
  v16 = (char *)self + OBJC_IVAR____TtC8Freeform20CRLFollowCoordinator_expectingViewportFromUUID;
  swift_beginAccess((char *)self + OBJC_IVAR____TtC8Freeform20CRLFollowCoordinator_expectingViewportFromUUID, v21, 33, 0);
  v17 = self;
  sub_100582338((uint64_t)v10, (uint64_t)v16, (uint64_t *)&unk_1013E1A50);
  swift_endAccess(v21);
  v18 = type metadata accessor for CRLFollowViewportState(0);
  (*(void (**)(_BYTE *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 56))(v7, 1, 1, v18);
  v19 = (uint64_t)v17 + OBJC_IVAR____TtC8Freeform20CRLFollowCoordinator_viewportToApply;
  swift_beginAccess((char *)v17 + OBJC_IVAR____TtC8Freeform20CRLFollowCoordinator_viewportToApply, v21, 33, 0);
  sub_100582338((uint64_t)v7, v19, &qword_1013EE2E0);
  swift_endAccess(v21);

  sub_1004CB800((uint64_t)v13, (uint64_t *)&unk_1013E1A50);
}

- (void)crlaxNotifyFollowFeatureOfBenignScrollViewDidScrollEvent
{
  uint64_t v3;
  uint64_t v4;
  _BYTE *v5;
  _TtC8Freeform20CRLFollowCoordinator *v6;
  __n128 v7;
  uint64_t v8;
  uint64_t v9;
  _BYTE v11[24];

  v3 = sub_1004B804C(&qword_1013E04F0);
  __chkstk_darwin(v3);
  v5 = &v11[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  v6 = self;
  static Date.now.getter(v7);
  v8 = type metadata accessor for Date(0);
  (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56))(v5, 0, 1, v8);
  v9 = (uint64_t)v6 + OBJC_IVAR____TtC8Freeform20CRLFollowCoordinator_crlaxFollowFeatureLastScrollTimestamp;
  swift_beginAccess((char *)v6 + OBJC_IVAR____TtC8Freeform20CRLFollowCoordinator_crlaxFollowFeatureLastScrollTimestamp, v11, 33, 0);
  sub_100582338((uint64_t)v5, v9, &qword_1013E04F0);
  swift_endAccess(v11);

}

- (_TtC8Freeform43CRLFollowAccessibilityExperienceCoordinator)accessibilityExperienceCoordinator
{
  _TtC8Freeform20CRLFollowCoordinator *v2;
  id v3;

  v2 = self;
  v3 = sub_100700E5C();

  return (_TtC8Freeform43CRLFollowAccessibilityExperienceCoordinator *)v3;
}

- (void)setAccessibilityExperienceCoordinator:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC8Freeform20CRLFollowCoordinator____lazy_storage___accessibilityExperienceCoordinator);
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC8Freeform20CRLFollowCoordinator____lazy_storage___accessibilityExperienceCoordinator) = (Class)a3;
  v3 = a3;

}

- (NSArray)crlaxCurrentICCs
{
  void *v2;
  _TtC8Freeform20CRLFollowCoordinator *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  Class isa;

  v2 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform20CRLFollowCoordinator_interactiveCanvasControllers);
  v3 = self;
  v4 = objc_msgSend(v2, "allObjects");
  v5 = sub_1004B8930(0, &qword_1013E4890, off_101229918);
  v6 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v4, v5);

  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v6);
  return (NSArray *)isa;
}

- (void)crlaxEndFollowingForCanvasScrollIfNeeded
{
  _TtC8Freeform20CRLFollowCoordinator *v2;

  v2 = self;
  sub_100700FA4();

}

- (_TtC8Freeform20CRLFollowCoordinator)init
{
  return (_TtC8Freeform20CRLFollowCoordinator *)sub_100701404();
}

@end
