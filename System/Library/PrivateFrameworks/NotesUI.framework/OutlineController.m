@implementation OutlineController

- (ICTTTextStorage)textStorage
{
  return (ICTTTextStorage *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                    + OBJC_IVAR___OutlineController_textStorage));
}

- (NSSet)collapsedUUIDs
{
  OutlineController *v3;
  void *v4;

  swift_beginAccess();
  v3 = self;
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED6E9220);
  sub_1ACA4251C();

  swift_release();
  sub_1ACA3FA08();
  sub_1AC7C3B88(&qword_1ED6E90D8, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB0998], MEMORY[0x1E0CB09C8]);
  v4 = (void *)sub_1ACA4233C();
  swift_bridgeObjectRelease();
  return (NSSet *)v4;
}

- (void)setCollapsedUUIDs:(id)a3
{
  uint64_t v4;
  OutlineController *v5;
  _QWORD v6[4];
  uint64_t v7;

  sub_1ACA3FA08();
  sub_1AC7C3B88(&qword_1ED6E90D8, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB0998], MEMORY[0x1E0CB09C8]);
  v4 = sub_1ACA42348();
  swift_beginAccess();
  v7 = v4;
  v6[2] = &v7;
  v5 = self;
  swift_retain();
  sub_1AC8D1CFC((uint64_t)sub_1AC8E0E88, (uint64_t)v6);

  swift_release();
  swift_bridgeObjectRelease();
}

- (NSSet)interactedUUIDs
{
  OutlineController *v2;
  void *v3;

  v2 = self;
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED6E9220);
  sub_1ACA4251C();

  swift_release();
  sub_1ACA3FA08();
  sub_1AC7C3B88(&qword_1ED6E90D8, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB0998], MEMORY[0x1E0CB09C8]);
  v3 = (void *)sub_1ACA4233C();
  swift_bridgeObjectRelease();
  return (NSSet *)v3;
}

- (void)setInteractedUUIDs:(id)a3
{
  OutlineController *v4;
  _QWORD v5[3];
  uint64_t v6;

  sub_1ACA3FA08();
  sub_1AC7C3B88(&qword_1ED6E90D8, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB0998], MEMORY[0x1E0CB09C8]);
  v5[2] = &v6;
  v6 = sub_1ACA42348();
  v4 = self;
  swift_retain();
  sub_1AC8D1CFC((uint64_t)sub_1AC8E0E88, (uint64_t)v5);

  swift_release();
  swift_bridgeObjectRelease();
}

- (BOOL)isAsynchronous
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR___OutlineController_isAsynchronous;
  swift_beginAccess();
  return *v2;
}

- (void)setIsAsynchronous:(BOOL)a3
{
  OutlineController *v4;

  v4 = self;
  sub_1AC8D2E88(a3);

}

- (OutlineController)initWithTextStorage:(id)a3 collapsedUUIDs:(id)a4 asynchronous:(BOOL)a5
{
  uint64_t v7;

  sub_1ACA3FA08();
  sub_1AC7C3B88(&qword_1ED6E90D8, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB0998], MEMORY[0x1E0CB09C8]);
  v7 = sub_1ACA42348();
  return (OutlineController *)OutlineController.init(textStorage:collapsedUUIDs:asynchronous:)(a3, v7, a5);
}

- (void)requestUpdate
{
  unsigned __int8 *v3;
  int v4;
  OutlineController *v5;
  OutlineController *v6;

  v3 = (unsigned __int8 *)self + OBJC_IVAR___OutlineController_isAsynchronous;
  swift_beginAccess();
  v4 = *v3;
  v5 = self;
  if (v4 == 1)
  {
    v6 = (OutlineController *)sub_1AC8D9E54();
    -[OutlineController requestFire](v6, sel_requestFire);

    v5 = v6;
  }
  else
  {
    sub_1AC8D2F4C();
  }

}

- (BOOL)canCollapseAnyUUIDs:(id)a3
{
  return sub_1AC8D59E8(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(uint64_t))sub_1AC8D3B24);
}

- (BOOL)isUUIDCollapsible:(id)a3
{
  return sub_1AC8D6F4C(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(char *))sub_1AC8D474C);
}

- (BOOL)isUUIDCollapsed:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  OutlineController *v8;
  uint64_t v10[3];

  v4 = sub_1ACA3FA08();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1ACA3F9F0();
  swift_beginAccess();
  v8 = self;
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED6E9220);
  sub_1ACA4251C();
  swift_release();
  LOBYTE(self) = sub_1AC8D3BF8((uint64_t)v7, v10[2]);

  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return self & 1;
}

- (void)collapseUUIDs:(id)a3
{
  sub_1AC8D5DC0(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t))sub_1AC8D4B74);
}

- (void)toggleUUIDCollapsed:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  OutlineController *v8;
  uint64_t v9;

  v4 = sub_1ACA3FA08();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1ACA3F9F0();
  v8 = self;
  sub_1AC8D52FC((uint64_t)v7);

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (void)collapseAll
{
  OutlineController *v2;

  v2 = self;
  sub_1AC8D5730();

}

- (BOOL)canExpandAnyUUIDs:(id)a3
{
  return sub_1AC8D59E8(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(uint64_t))sub_1AC8D592C);
}

- (void)expandUUIDs:(id)a3
{
  sub_1AC8D5DC0(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t))sub_1AC8D5A74);
}

- (void)expandAncestorsOfRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  OutlineController *v5;

  length = a3.length;
  location = a3.location;
  v5 = self;
  sub_1AC8D5E40(location, length);

}

- (void)expandAll
{
  OutlineController *v2;

  v2 = self;
  sub_1AC8D6414();

}

- (void)collapsibleSectionAffordanceUsedForUUIDs:(id)a3
{
  sub_1AC8D5DC0(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t))sub_1AC8D65E0);
}

- (int64_t)collapsibleSectionAffordanceUsages
{
  OutlineController *v2;
  int64_t v3;
  uint64_t v5;

  v2 = self;
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED6E9220);
  sub_1ACA4251C();
  swift_release();
  v3 = *(_QWORD *)(v5 + 16);

  swift_bridgeObjectRelease();
  return v3;
}

- (_NSRange)visibleRange
{
  OutlineController *v2;
  uint64_t v3;
  NSUInteger v4;
  NSUInteger v5;
  NSUInteger v6;
  NSUInteger v7;
  _NSRange result;

  v2 = self;
  v3 = sub_1AC8D6814();
  v5 = v4;

  v6 = v3;
  v7 = v5;
  result.length = v7;
  result.location = v6;
  return result;
}

- (void)resetCollapsibleSectionAffordanceUsages
{
  OutlineController *v2;
  _QWORD v3[3];
  uint64_t v4;

  v3[2] = &v4;
  v4 = MEMORY[0x1E0DEE9E8];
  v2 = self;
  swift_retain();
  sub_1AC8D1CFC((uint64_t)sub_1AC8E0E88, (uint64_t)v3);

  swift_release();
  swift_bridgeObjectRelease();
}

- (BOOL)isUUIDHidden:(id)a3
{
  return sub_1AC8D6F4C(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(char *))sub_1AC8D6D38);
}

- (_NSRange)rangeForUUID:(id)a3
{
  NSUInteger v3;
  NSUInteger v4;
  _NSRange result;

  v3 = sub_1AC8D7C3C(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(char *))sub_1AC8D6FF4);
  result.length = v4;
  result.location = v3;
  return result;
}

- (_NSRange)descendantRangeForUUID:(id)a3
{
  NSUInteger v3;
  NSUInteger v4;
  _NSRange result;

  v3 = sub_1AC8D7C3C(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(char *))sub_1AC8D74F0);
  result.length = v4;
  result.location = v3;
  return result;
}

- (id)closestVisibleAncestorForUUID:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  OutlineController *v11;
  void (*v12)(char *, uint64_t);
  void *v13;
  uint64_t v15;

  v4 = sub_1ACA3FA08();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED6E90F0);
  MEMORY[0x1E0C80A78](v8);
  v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1ACA3F9F0();
  v11 = self;
  sub_1AC8D7CEC((uint64_t)v7, v10);

  v12 = *(void (**)(char *, uint64_t))(v5 + 8);
  v12(v7, v4);
  v13 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v5 + 48))(v10, 1, v4) != 1)
  {
    v13 = (void *)sub_1ACA3F9D8();
    v12(v10, v4);
  }
  return v13;
}

- (id)ancestorsForUUID:(id)a3
{
  return sub_1AC8D84E0(self, (uint64_t)a2, (uint64_t)a3, (void (*)(char *))sub_1AC8D81C8);
}

- (id)descendantsForUUID:(id)a3
{
  return sub_1AC8D84E0(self, (uint64_t)a2, (uint64_t)a3, (void (*)(char *))sub_1AC8D8354);
}

- (NSString)debugDescription
{
  OutlineController *v2;
  void *v3;

  v2 = self;
  sub_1AC8D85F4();

  v3 = (void *)sub_1ACA42090();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (void)textStorageDidProcessEndEditingWithNotification:(id)a3
{
  id v4;
  OutlineController *v5;

  v4 = a3;
  v5 = self;
  sub_1AC8D9FB4(v4);

}

- (void)mergingWillBeginWithNotification:(id)a3
{
  sub_1AC8DA314(self, (uint64_t)a2, a3, 1);
}

- (void)mergingDidEndWithNotification:(id)a3
{
  sub_1AC8DA314(self, (uint64_t)a2, a3, 0);
}

- (void)update
{
  OutlineController *v2;

  v2 = self;
  sub_1AC8D2F4C();

}

- (OutlineController)init
{
  OutlineController *result;

  result = (OutlineController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

  swift_release();
  swift_release();
  swift_release();

}

@end
