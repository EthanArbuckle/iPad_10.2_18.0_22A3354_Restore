@implementation DOCHierarchyController

- (_TtC5Files22DOCHierarchyController)initWithConfiguration:(id)a3 sourceObserver:(id)a4 minParentLocations:(unint64_t)a5
{
  objc_class *ObjectType;
  void *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;

  ObjectType = (objc_class *)swift_getObjectType(self, a2);
  v10 = (void *)objc_opt_self(FPItemManager);
  v11 = a3;
  v12 = a4;
  v13 = objc_msgSend(v10, "defaultManager");
  v14 = objc_msgSend((id)objc_opt_self(DOCUserInterfaceStateStore), "sharedStore");
  v15 = objc_allocWithZone(ObjectType);
  v16 = DOCHierarchyController.init(configuration:sourceObserver:minParentLocations:itemManager:userInterfaceStateStore:)(v11, v12, a5, v13, v14);
  v18 = swift_getObjectType(self, v17);
  swift_deallocPartialClassInstance(self, v18, *(unsigned int *)((swift_isaMask & (uint64_t)self->super.isa) + 0x30), *(unsigned __int16 *)((swift_isaMask & (uint64_t)self->super.isa) + 0x34));
  return (_TtC5Files22DOCHierarchyController *)v16;
}

- (NSArray)locations
{
  uint64_t *v2;
  uint64_t v3;
  Class isa;
  _BYTE v6[24];

  v2 = (uint64_t *)((char *)self + OBJC_IVAR____TtC5Files22DOCHierarchyController_locations);
  swift_beginAccess((char *)self + OBJC_IVAR____TtC5Files22DOCHierarchyController_locations, v6, 0, 0);
  v3 = *v2;
  sub_10004F2F0(0, (unint64_t *)&unk_1006442E0, DOCConcreteLocation_ptr);
  swift_bridgeObjectRetain(v3);
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v3);
  return (NSArray *)isa;
}

- (void)setDelegate:(id)a3
{
  swift_unknownObjectWeakAssign((char *)self + OBJC_IVAR____TtC5Files22DOCHierarchyController_delegate, a3);
}

- (void)resetWithDefaultLocationWithAnimated:(BOOL)a3
{
  _BOOL4 v3;
  _TtC5Files22DOCHierarchyController *v4;

  v3 = a3;
  v4 = self;
  sub_10001B6D0(v3);

}

- (void)invalidateAllAssertions
{
  _TtC5Files22DOCHierarchyController *v2;
  uint64_t v3;

  v2 = self;
  v3 = sub_1000ABE80();
  (*(void (**)(uint64_t))(*(_QWORD *)v3 + 144))(v3);

  swift_release(v3);
}

- (DOCConcreteLocation)effectiveRootLocation
{
  _TtC5Files22DOCHierarchyController *v2;
  void *v3;

  v2 = self;
  v3 = (void *)sub_100038378();

  return (DOCConcreteLocation *)v3;
}

- (DOCConcreteLocation)lastLocation
{
  _TtC5Files22DOCHierarchyController *v2;
  void *v3;

  v2 = self;
  v3 = (void *)sub_100005D2C();

  return (DOCConcreteLocation *)v3;
}

- (unint64_t)effectiveTabSwitcherTab
{
  _TtC5Files22DOCHierarchyController *v2;
  _TtC5Files22DOCHierarchyController *v3;
  _TtC5Files22DOCHierarchyController *v4;
  unint64_t v5;

  v2 = self;
  sub_1001D3F78();
  if (v3)
  {
    v4 = v3;
    v5 = -[DOCHierarchyController effectiveTabSwitcherTab](v3, "effectiveTabSwitcherTab");

    v2 = v4;
  }
  else
  {
    v5 = *(unint64_t *)((char *)&v2->super.isa + OBJC_IVAR____TtC5Files22DOCHierarchyController_defaultTab);
  }

  return v5;
}

- (_TtP5Files30DOCHierarchyControllerDelegate_)delegate
{
  return (_TtP5Files30DOCHierarchyControllerDelegate_ *)(id)swift_unknownObjectWeakLoadStrong((char *)self+ OBJC_IVAR____TtC5Files22DOCHierarchyController_delegate, a2);
}

- (void)setLocations:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  _TtC5Files22DOCHierarchyController *v7;

  v5 = sub_10004F2F0(0, (unint64_t *)&unk_1006442E0, DOCConcreteLocation_ptr);
  v6 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, v5);
  v7 = self;
  DOCHierarchyController.locations.setter(v6);

}

- (NSArray)effectiveLocations
{
  _TtC5Files22DOCHierarchyController *v2;
  _QWORD *v3;
  Class isa;

  v2 = self;
  v3 = sub_1001D5A88();

  sub_10004F2F0(0, (unint64_t *)&unk_1006442E0, DOCConcreteLocation_ptr);
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v3);
  return (NSArray *)isa;
}

- (unint64_t)defaultTab
{
  return *(unint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC5Files22DOCHierarchyController_defaultTab);
}

- (void)setDefaultTab:(unint64_t)a3
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC5Files22DOCHierarchyController_defaultTab) = (Class)a3;
}

- (BOOL)hasPendingLocationChange
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  char *v6;
  uint64_t v7;
  _BYTE v10[24];

  v3 = sub_10006922C((uint64_t *)&unk_1006443D0);
  __chkstk_darwin(v3);
  v5 = &v10[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  v6 = (char *)self + OBJC_IVAR____TtC5Files22DOCHierarchyController_localOperation;
  swift_beginAccess(v6, v10, 0, 0);
  sub_1000271D4((uint64_t)v6, (uint64_t)v5, (uint64_t *)&unk_1006443D0);
  v7 = type metadata accessor for DOCHierarchyController.FetchingOperationToken(0);
  LOBYTE(v6) = (*(unsigned int (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 48))(v5, 1, v7) != 1;
  sub_10000CB4C((uint64_t)v5, (uint64_t *)&unk_1006443D0);
  return (char)v6;
}

- (DOCConcreteLocation)locationForDeterminingCurrentEffectiveTab
{
  _TtC5Files22DOCHierarchyController *v2;
  void *v3;
  void *v4;

  v2 = self;
  sub_1001D3F78();
  v4 = v3;

  return (DOCConcreteLocation *)v4;
}

- (BOOL)effectiveRootLocationIsHidingParentLocations
{
  _TtC5Files22DOCHierarchyController *v2;
  char v3;

  v2 = self;
  v3 = sub_1001D38B4();

  return v3 & 1;
}

- (void)loadAllParentsHiddenByEffectiveRootLocation:(id)a3
{
  void *v4;
  uint64_t v5;
  _TtC5Files22DOCHierarchyController *v6;

  v4 = _Block_copy(a3);
  v5 = swift_allocObject(&unk_1005D0FB8, 24, 7);
  *(_QWORD *)(v5 + 16) = v4;
  v6 = self;
  sub_1001D3A64((uint64_t)sub_100145FB4, v5);

  swift_release(v5);
}

- (BOOL)isFetchingLocations
{
  _TtC5Files22DOCHierarchyController *v2;
  char v3;

  v2 = self;
  v3 = sub_1001D3710();

  return v3 & 1;
}

- (BOOL)isLoadingDisabled
{
  _TtC5Files22DOCHierarchyController *v2;
  char v3;

  v2 = self;
  v3 = sub_1001D6AC8();

  return v3 & 1;
}

- (void)performWhilePreventingLoading:(id)a3
{
  uint64_t (**v4)(_QWORD, __n128);
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __n128 v8;
  uint64_t v9;
  _TtC5Files22DOCHierarchyController *v10;

  v4 = (uint64_t (**)(_QWORD, __n128))_Block_copy(a3);
  v5 = type metadata accessor for DOCAssertion(0);
  swift_allocObject(v5, 48, 7);
  v10 = self;
  v6 = DOCAssertion.init(traceInfo:)(0xD00000000000001DLL, 0x8000000100518840);
  v7 = sub_1000ABE80();
  (*(void (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)v7 + 136))(v6, 0, 1);
  v8 = swift_release(v7);
  v9 = v4[2](v4, v8);
  (*(void (**)(uint64_t))(*(_QWORD *)v6 + 160))(v9);
  swift_release(v6);
  _Block_release(v4);

}

- (BOOL)shouldForceChangeInPreparationQueue
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC5Files22DOCHierarchyController_shouldForceChangeInPreparationQueue);
}

- (void)setShouldForceChangeInPreparationQueue:(BOOL)a3
{
  *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC5Files22DOCHierarchyController_shouldForceChangeInPreparationQueue) = a3;
}

- (void)performWhileForcingChangeInPreparationQueue:(id)a3
{
  _QWORD *v4;
  uint64_t v5;
  char v6;
  void (*v7)(_QWORD *);
  _TtC5Files22DOCHierarchyController *v8;

  v4 = _Block_copy(a3);
  v5 = OBJC_IVAR____TtC5Files22DOCHierarchyController_shouldForceChangeInPreparationQueue;
  v6 = *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC5Files22DOCHierarchyController_shouldForceChangeInPreparationQueue);
  *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC5Files22DOCHierarchyController_shouldForceChangeInPreparationQueue) = 1;
  v7 = (void (*)(_QWORD *))v4[2];
  v8 = self;
  v7(v4);
  *((_BYTE *)&self->super.isa + v5) = v6;
  _Block_release(v4);

}

- (_TtC5Files16DOCPickerContext)pickerContext
{
  return (_TtC5Files16DOCPickerContext *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                                 + OBJC_IVAR____TtC5Files22DOCHierarchyController_pickerContext));
}

- (void)setPickerContext:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC5Files22DOCHierarchyController_pickerContext);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC5Files22DOCHierarchyController_pickerContext) = (Class)a3;
  v3 = a3;

}

- (void)dealloc
{
  _TtC5Files22DOCHierarchyController *v2;

  v2 = self;
  DOCHierarchyController.__deallocating_deinit();
}

- (void).cxx_destruct
{
  sub_10008F5C0((uint64_t)self + OBJC_IVAR____TtC5Files22DOCHierarchyController_delegate);
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC5Files22DOCHierarchyController_locations));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC5Files22DOCHierarchyController__lastBrowsedStateByTab));
  sub_10000CB4C((uint64_t)self + OBJC_IVAR____TtC5Files22DOCHierarchyController__currentUpdateExpectation, (uint64_t *)&unk_1006475B0);
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC5Files22DOCHierarchyController_locationsBeingRestored));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC5Files22DOCHierarchyController_effectiveRootLocationCandidate));
  sub_10000CB4C((uint64_t)self + OBJC_IVAR____TtC5Files22DOCHierarchyController_loadingDisabledOperation, (uint64_t *)&unk_1006443D0);
  sub_10000CB4C((uint64_t)self + OBJC_IVAR____TtC5Files22DOCHierarchyController_localOperation, (uint64_t *)&unk_1006443D0);
  sub_100087534(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC5Files22DOCHierarchyController_delayedLoadingBlock), *(_QWORD *)&self->delegate[OBJC_IVAR____TtC5Files22DOCHierarchyController_delayedLoadingBlock]);
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC5Files22DOCHierarchyController____lazy_storage___loadingDisabledAssertions));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC5Files22DOCHierarchyController_locationChangePreparationQueue));

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC5Files22DOCHierarchyController_lastVisitedLocationSavingQueue));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC5Files22DOCHierarchyController_preventImmediateChangeAssertions));

  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC5Files22DOCHierarchyController____lazy_storage___userDefaultsObservedContent));

  sub_100146170(*(void **)((char *)&self->super.isa + OBJC_IVAR____TtC5Files22DOCHierarchyController_activeOrInflightAppend), *(void **)&self->delegate[OBJC_IVAR____TtC5Files22DOCHierarchyController_activeOrInflightAppend]);
}

- (void)resetWith:(id)a3 animated:(BOOL)a4 completionHandler:(id)a5
{
  _BOOL4 v5;
  void (*v8)(void);
  uint64_t v9;
  id v10;
  _TtC5Files22DOCHierarchyController *v11;

  v5 = a4;
  v8 = (void (*)(void))_Block_copy(a5);
  if (v8)
  {
    v9 = swift_allocObject(&unk_1005D0F40, 24, 7);
    *(_QWORD *)(v9 + 16) = v8;
    v8 = (void (*)(void))sub_1001F6B10;
  }
  else
  {
    v9 = 0;
  }
  v10 = a3;
  v11 = self;
  sub_1001D4F4C(v10, a3, v5, 1, 0, v8, v9);
  sub_100087534((uint64_t)v8, v9);

}

- (void)resetWith:(id)a3 effectiveRootLocation:(id)a4 animated:(BOOL)a5 completionHandler:(id)a6
{
  _BOOL4 v6;
  void (*v10)(void);
  uint64_t v11;
  id v12;
  id v13;
  _TtC5Files22DOCHierarchyController *v14;

  v6 = a5;
  v10 = (void (*)(void))_Block_copy(a6);
  if (v10)
  {
    v11 = swift_allocObject(&unk_1005D0F18, 24, 7);
    *(_QWORD *)(v11 + 16) = v10;
    v10 = (void (*)(void))sub_1001F6B10;
  }
  else
  {
    v11 = 0;
  }
  v12 = a3;
  v13 = a4;
  v14 = self;
  sub_1001D4F4C(v12, a4, v6, 1, 0, v10, v11);
  sub_100087534((uint64_t)v10, v11);

}

- (void)resetFromRootWith:(id)a3 animated:(BOOL)a4 completionHandler:(id)a5
{
  void (*v8)(void);
  uint64_t v9;
  id v10;
  _TtC5Files22DOCHierarchyController *v11;

  v8 = (void (*)(void))_Block_copy(a5);
  if (v8)
  {
    v9 = swift_allocObject(&unk_1005D0EF0, 24, 7);
    *(_QWORD *)(v9 + 16) = v8;
    v8 = (void (*)(void))sub_1001F6B10;
  }
  else
  {
    v9 = 0;
  }
  v10 = a3;
  v11 = self;
  sub_1001D86A8(v10, a4, v8, v9);
  sub_100087534((uint64_t)v8, v9);

}

- (void)revealLocation:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  _BOOL4 v5;
  void (*v8)(void);
  uint64_t v9;
  id v10;
  _TtC5Files22DOCHierarchyController *v11;

  v5 = a4;
  v8 = (void (*)(void))_Block_copy(a5);
  if (v8)
  {
    v9 = swift_allocObject(&unk_1005D0EA0, 24, 7);
    *(_QWORD *)(v9 + 16) = v8;
    v8 = (void (*)(void))sub_1000E62C0;
  }
  else
  {
    v9 = 0;
  }
  v10 = a3;
  v11 = self;
  sub_1001D9900(v10, v5, v8, v9);
  sub_100087534((uint64_t)v8, v9);

}

- (void)reset
{
  _TtC5Files22DOCHierarchyController *v2;

  v2 = self;
  sub_1001DAB74();

}

- (void)removeTrailingLocationCount:(int64_t)a3 animated:(BOOL)a4
{
  _TtC5Files22DOCHierarchyController *v5;

  v5 = self;
  sub_1001F3814(a3);

}

- (_TtC5Files22DOCHierarchyController)init
{
  _TtC5Files22DOCHierarchyController *result;

  result = (_TtC5Files22DOCHierarchyController *)_swift_stdlib_reportUnimplementedInitializer("Files.DOCHierarchyController", 28, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void)receiveInvalidateLocationsNotification
{
  void *v3;
  _TtC5Files22DOCHierarchyController *v4;

  v3 = (void *)objc_opt_self(NSObject);
  v4 = self;
  objc_msgSend(v3, "cancelPreviousPerformRequestsWithTarget:selector:object:", v4, "invalidateLocations", 0);
  -[DOCHierarchyController performSelector:withObject:afterDelay:](v4, "performSelector:withObject:afterDelay:", "invalidateLocations", 0, 0.2);

}

- (void)invalidateLocations
{
  _TtC5Files22DOCHierarchyController *v2;

  v2 = self;
  sub_1001E7DE4();

}

- (void)restoreLastBrowsedStateForTab:(unint64_t)a3
{
  _TtC5Files22DOCHierarchyController *v4;

  v4 = self;
  DOCHierarchyController.restoreLastBrowsedState(forTab:)((void *)a3);

}

- (void)tagsDidChangeWithNotification:(id)a3
{
  id v4;
  _TtC5Files22DOCHierarchyController *v5;

  v4 = a3;
  v5 = self;
  sub_1001F5FE8();

}

@end
