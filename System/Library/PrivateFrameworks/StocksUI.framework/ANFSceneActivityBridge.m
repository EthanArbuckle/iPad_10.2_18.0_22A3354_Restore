@implementation ANFSceneActivityBridge

- (void)performOnSceneDidDisconnect:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  unsigned __int8 *sceneDidDisconnectObserverBlocks;
  _QWORD *v8;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v10;
  unint64_t v11;
  _QWORD *v12;

  v4 = _Block_copy(a3);
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = v4;
  v6 = swift_allocObject();
  *(_QWORD *)(v6 + 16) = sub_1DC167734;
  *(_QWORD *)(v6 + 24) = v5;
  sceneDidDisconnectObserverBlocks = self->sceneDidDisconnectObserverBlocks;
  swift_beginAccess();
  v8 = *(_QWORD **)self->sceneDidDisconnectObserverBlocks;
  swift_retain();
  swift_retain();
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *(_QWORD *)self->sceneDidDisconnectObserverBlocks = v8;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    v8 = sub_1DC16675C(0, v8[2] + 1, 1, v8);
    *(_QWORD *)sceneDidDisconnectObserverBlocks = v8;
  }
  v11 = v8[2];
  v10 = v8[3];
  if (v11 >= v10 >> 1)
  {
    v8 = sub_1DC16675C((_QWORD *)(v10 > 1), v11 + 1, 1, v8);
    *(_QWORD *)sceneDidDisconnectObserverBlocks = v8;
  }
  v8[2] = v11 + 1;
  v12 = &v8[2 * v11];
  v12[4] = sub_1DC167858;
  v12[5] = v6;
  swift_endAccess();
  swift_release();
  swift_release();
}

@end
