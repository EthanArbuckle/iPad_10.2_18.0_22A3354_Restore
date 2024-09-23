@implementation UIPointerHoverStyleDriver

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  id v6;
  id v7;
  _TtC5UIKit25UIPointerHoverStyleDriver *v8;
  void *v9;

  v6 = a3;
  v7 = a4;
  v8 = self;
  v9 = (void *)sub_18575EAF8();

  return v9;
}

- (_TtC5UIKit25UIPointerHoverStyleDriver)init
{
  _TtC5UIKit25UIPointerHoverStyleDriver *result;

  result = (_TtC5UIKit25UIPointerHoverStyleDriver *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  void *v3;

  sub_1852286E0((uint64_t)self + OBJC_IVAR____TtC5UIKit25UIPointerHoverStyleDriver__effect);
  v3 = *(void **)&self->_shape[OBJC_IVAR____TtC5UIKit25UIPointerHoverStyleDriver__shape + 8];
  sub_185223490(*(void **)((char *)&self->super.isa + OBJC_IVAR____TtC5UIKit25UIPointerHoverStyleDriver__shape), *(_QWORD *)&self->_effect[OBJC_IVAR____TtC5UIKit25UIPointerHoverStyleDriver__shape], *(_QWORD *)&self->_effect[OBJC_IVAR____TtC5UIKit25UIPointerHoverStyleDriver__shape + 8], *(_QWORD *)&self->_effect[OBJC_IVAR____TtC5UIKit25UIPointerHoverStyleDriver__shape + 16], *(_QWORD *)&self->_effect[OBJC_IVAR____TtC5UIKit25UIPointerHoverStyleDriver__shape + 24], *(_QWORD *)&self->_effect[OBJC_IVAR____TtC5UIKit25UIPointerHoverStyleDriver__shape + 32], *(_QWORD *)&self->_effect[OBJC_IVAR____TtC5UIKit25UIPointerHoverStyleDriver__shape + 40], self->_shape[OBJC_IVAR____TtC5UIKit25UIPointerHoverStyleDriver__shape]);

  swift_unknownObjectWeakDestroy();
  sub_18519F088((uint64_t)self + OBJC_IVAR____TtC5UIKit25UIPointerHoverStyleDriver_host, &qword_1EDD81A30);

}

@end
