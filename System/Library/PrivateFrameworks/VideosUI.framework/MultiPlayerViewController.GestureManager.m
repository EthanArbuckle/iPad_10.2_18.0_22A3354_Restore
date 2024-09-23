@implementation MultiPlayerViewController.GestureManager

- (void)viewSwipedWithGesture:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  OUTLINED_FUNCTION_26_5((uint64_t)self, (uint64_t)a2, a3);
  OUTLINED_FUNCTION_4_11();
  v4 = (void *)OUTLINED_FUNCTION_2_13();
  sub_1D9D0BF44(v4);

  OUTLINED_FUNCTION_4_3(v5);
}

- (void)viewPinchedWithGesture:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  OUTLINED_FUNCTION_26_5((uint64_t)self, (uint64_t)a2, a3);
  OUTLINED_FUNCTION_4_11();
  v4 = (void *)OUTLINED_FUNCTION_2_13();
  sub_1D9D0C090(v4);

  OUTLINED_FUNCTION_4_3(v5);
}

- (void)viewPannedWithGesture:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  OUTLINED_FUNCTION_26_5((uint64_t)self, (uint64_t)a2, a3);
  OUTLINED_FUNCTION_4_11();
  v4 = (void *)OUTLINED_FUNCTION_2_13();
  sub_1D9D0C1D4(v4);

  OUTLINED_FUNCTION_4_3(v5);
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  _QWORD *v3;
  id v4;
  BOOL result;

  OUTLINED_FUNCTION_26_5((uint64_t)self, (uint64_t)a2, a3);
  v4 = OUTLINED_FUNCTION_4_11();
  sub_1D9D0C250(v3);

  OUTLINED_FUNCTION_9();
  return result;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  char *v4;
  id v6;
  id v7;
  _TtCC8VideosUI25MultiPlayerViewController14GestureManager *v8;
  BOOL result;

  v6 = a3;
  v7 = OUTLINED_FUNCTION_4_11();
  v8 = self;
  sub_1D9D0C430(v4);

  OUTLINED_FUNCTION_9();
  return result;
}

- (_TtCC8VideosUI25MultiPlayerViewController14GestureManager)init
{
  sub_1D9D0C6D0();
}

- (void).cxx_destruct
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCC8VideosUI25MultiPlayerViewController14GestureManager____lazy_storage___activityTapGesture));
  OUTLINED_FUNCTION_120(OBJC_IVAR____TtCC8VideosUI25MultiPlayerViewController14GestureManager____lazy_storage___detailsPanGesture);
  OUTLINED_FUNCTION_120(OBJC_IVAR____TtCC8VideosUI25MultiPlayerViewController14GestureManager____lazy_storage___playerPinchGesture);
  OUTLINED_FUNCTION_120(OBJC_IVAR____TtCC8VideosUI25MultiPlayerViewController14GestureManager____lazy_storage___panGesture);
  swift_unknownObjectWeakDestroy();
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F02165D0);
  OUTLINED_FUNCTION_4_12(v2);
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F0207768);
  OUTLINED_FUNCTION_4_12(v3);
  OUTLINED_FUNCTION_120(OBJC_IVAR____TtCC8VideosUI25MultiPlayerViewController14GestureManager_pinchPlayerViewController);
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F02165C0);
  OUTLINED_FUNCTION_4_12(v4);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F02165B0);
  OUTLINED_FUNCTION_4_12(v5);
  swift_release();
  swift_release();
}

@end
