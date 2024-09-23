@implementation _UICollectionViewFeedbackLoopDebugger

- (void)recordPreferredAttributesChangeForElementWithAttributes:(id)a3 reason:(id)a4 changedAttribute:(id)a5 fromValue:(id)a6 toValue:(id)a7 layoutGeneratedValue:(id)a8
{
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  id v19;
  id v20;
  _UICollectionViewFeedbackLoopDebugger *v21;
  id v22;
  uint64_t v23;

  v23 = sub_1865074F8();
  v14 = v13;
  v15 = sub_1865074F8();
  v17 = v16;
  v18 = a3;
  v22 = a6;
  v19 = a7;
  v20 = a8;
  v21 = self;
  sub_1856666BC(v18, v23, v14, v15, v17, a6, a7, a8);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)recordCollectionViewRectPropertyChange:(id)a3 fromRect:(CGRect)a4 toRect:(CGRect)a5
{
  sub_185666CD8(self, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height, a5.origin.x, a5.origin.y, a5.size.width, a5.size.height, (uint64_t)a2, (uint64_t)a3, &qword_1EDD87028, &qword_1EDD87030);
}

- (void)recordCollectionViewPointPropertyChange:(id)a3 fromPoint:(CGPoint)a4 toPoint:(CGPoint)a5
{
  CGFloat y;
  CGFloat x;
  CGFloat v7;
  CGFloat v8;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD **v13;
  _QWORD *v14;
  _UICollectionViewFeedbackLoopDebugger *v15;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v17;
  unint64_t v18;
  CGFloat *v19;
  __int128 v20;
  uint64_t v21;
  uint64_t v22;

  y = a5.y;
  x = a5.x;
  v7 = a4.y;
  v8 = a4.x;
  v10 = sub_1865074F8();
  v12 = v11;
  v13 = (_QWORD **)((char *)self + OBJC_IVAR____UICollectionViewFeedbackLoopDebugger_currentlyTrackedChangeRecords);
  swift_beginAccess();
  v14 = *v13;
  v15 = self;
  swift_bridgeObjectRetain();
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *v13 = v14;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    v14 = sub_185647464(0, v14[2] + 1, 1, v14);
    *v13 = v14;
  }
  v18 = v14[2];
  v17 = v14[3];
  if (v18 >= v17 >> 1)
  {
    v14 = sub_185647464((_QWORD *)(v17 > 1), v18 + 1, 1, v14);
    *v13 = v14;
  }
  v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDD87018);
  v22 = sub_185638FF8(&qword_1EDD87020, &qword_1EDD87018, (uint64_t)&unk_18666C440);
  v19 = (CGFloat *)swift_allocObject();
  *(_QWORD *)&v20 = v19;
  *((_QWORD *)v19 + 2) = v10;
  *((_QWORD *)v19 + 3) = v12;
  v19[4] = v8;
  v19[5] = v7;
  v19[6] = x;
  v19[7] = y;
  v14[2] = v18 + 1;
  sub_1851E59E0(&v20, (uint64_t)&v14[5 * v18 + 4]);
  swift_endAccess();

  swift_bridgeObjectRelease();
}

- (void)recordCollectionViewInsetsPropertyChange:(id)a3 fromInsets:(UIEdgeInsets)a4 toInsets:(UIEdgeInsets)a5
{
  sub_185666CD8(self, a4.top, a4.left, a4.bottom, a4.right, a5.top, a5.left, a5.bottom, a5.right, (uint64_t)a2, (uint64_t)a3, &qword_1EDD87008, &qword_1EDD87010);
}

- (void)recordGenericChangeWithMessage:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD **v7;
  _QWORD *v8;
  _UICollectionViewFeedbackLoopDebugger *v9;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v11;
  unint64_t v12;
  __int128 v13;
  uint64_t v14;
  _UNKNOWN **v15;

  v4 = sub_1865074F8();
  v6 = v5;
  v7 = (_QWORD **)((char *)self + OBJC_IVAR____UICollectionViewFeedbackLoopDebugger_currentlyTrackedChangeRecords);
  swift_beginAccess();
  v8 = *v7;
  v9 = self;
  swift_bridgeObjectRetain();
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *v7 = v8;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    v8 = sub_185647464(0, v8[2] + 1, 1, v8);
    *v7 = v8;
  }
  v12 = v8[2];
  v11 = v8[3];
  if (v12 >= v11 >> 1)
  {
    v8 = sub_185647464((_QWORD *)(v11 > 1), v12 + 1, 1, v8);
    *v7 = v8;
  }
  v14 = MEMORY[0x1E0DEA968];
  v15 = &off_1E1687D00;
  *(_QWORD *)&v13 = v4;
  *((_QWORD *)&v13 + 1) = v6;
  v8[2] = v12 + 1;
  sub_1851E59E0(&v13, (uint64_t)&v8[5 * v12 + 4]);
  swift_endAccess();

  swift_bridgeObjectRelease();
}

- (void)recordInvalidationWithContext:(id)a3
{
  id v4;
  _UICollectionViewFeedbackLoopDebugger *v5;

  v4 = a3;
  v5 = self;
  sub_185666ED4(v4);

}

- (void)recordUpdateVisibleCellsScheduledWithCallStack:(id)a3
{
  uint64_t v4;
  _UICollectionViewFeedbackLoopDebugger *v5;

  v4 = sub_186507654();
  v5 = self;
  sub_185667068(v4);

  swift_bridgeObjectRelease();
}

- (void)printCollectedRecordsForCollectionView:(id)a3 raiseException:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  _UICollectionViewFeedbackLoopDebugger *v7;

  v4 = a4;
  v6 = a3;
  v7 = self;
  sub_185667220(v6, v4);

}

- (_UICollectionViewFeedbackLoopDebugger)init
{
  objc_class *v2;
  objc_super v4;

  v2 = (objc_class *)MEMORY[0x1E0DEE9D8];
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____UICollectionViewFeedbackLoopDebugger_currentlyTrackedChangeRecords) = (Class)MEMORY[0x1E0DEE9D8];
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____UICollectionViewFeedbackLoopDebugger_invalidationRecords) = v2;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____UICollectionViewFeedbackLoopDebugger_updateVisibleCellsRecords) = v2;
  v4.receiver = self;
  v4.super_class = (Class)_UICollectionViewFeedbackLoopDebugger;
  return -[_UICollectionViewFeedbackLoopDebugger init](&v4, sel_init);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
