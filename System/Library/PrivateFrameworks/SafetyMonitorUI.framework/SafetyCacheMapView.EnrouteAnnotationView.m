@implementation SafetyCacheMapView.EnrouteAnnotationView

- (MKAnnotation)annotation
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return -[MKAnnotationView annotation](&v3, sel_annotation);
}

- (void)setAnnotation:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  swift_unknownObjectRetain();
  v4 = v5.receiver;
  -[MKAnnotationView setAnnotation:](&v5, sel_setAnnotation_, a3);
  sub_24567EA60();

  swift_unknownObjectRelease();
}

- (void)prepareForReuse
{
  _TtCV15SafetyMonitorUI18SafetyCacheMapViewP33_0136281DCC3F5D58BE1F34FEE765118621EnrouteAnnotationView *v2;

  v2 = self;
  sub_24567EF08();

}

- (_TtCV15SafetyMonitorUI18SafetyCacheMapViewP33_0136281DCC3F5D58BE1F34FEE765118621EnrouteAnnotationView)initWithAnnotation:(id)a3 reuseIdentifier:(id)a4
{
  objc_class *ObjectType;
  _TtCV15SafetyMonitorUI18SafetyCacheMapViewP33_0136281DCC3F5D58BE1F34FEE765118621EnrouteAnnotationView *v8;
  objc_super v10;

  ObjectType = (objc_class *)swift_getObjectType();
  if (a4)
  {
    sub_2456FA840();
    *(Class *)((char *)&self->super.super.super.super.isa
             + OBJC_IVAR____TtCV15SafetyMonitorUI18SafetyCacheMapViewP33_0136281DCC3F5D58BE1F34FEE765118621EnrouteAnnotationView_annotationHostingController) = 0;
    swift_unknownObjectRetain();
    a4 = (id)sub_2456FA834();
    swift_bridgeObjectRelease();
  }
  else
  {
    *(Class *)((char *)&self->super.super.super.super.isa
             + OBJC_IVAR____TtCV15SafetyMonitorUI18SafetyCacheMapViewP33_0136281DCC3F5D58BE1F34FEE765118621EnrouteAnnotationView_annotationHostingController) = 0;
    swift_unknownObjectRetain();
  }
  v10.receiver = self;
  v10.super_class = ObjectType;
  v8 = -[MKAnnotationView initWithAnnotation:reuseIdentifier:](&v10, sel_initWithAnnotation_reuseIdentifier_, a3, a4);

  swift_unknownObjectRelease();
  return v8;
}

- (_TtCV15SafetyMonitorUI18SafetyCacheMapViewP33_0136281DCC3F5D58BE1F34FEE765118621EnrouteAnnotationView)initWithCoder:(id)a3
{
  objc_class *ObjectType;
  objc_super v7;

  ObjectType = (objc_class *)swift_getObjectType();
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtCV15SafetyMonitorUI18SafetyCacheMapViewP33_0136281DCC3F5D58BE1F34FEE765118621EnrouteAnnotationView_annotationHostingController) = 0;
  v7.receiver = self;
  v7.super_class = ObjectType;
  return -[MKAnnotationView initWithCoder:](&v7, sel_initWithCoder_, a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtCV15SafetyMonitorUI18SafetyCacheMapViewP33_0136281DCC3F5D58BE1F34FEE765118621EnrouteAnnotationView_annotationHostingController));
}

@end
