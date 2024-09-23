@implementation UISearchController

+ (id)docSearchControllerForSearchingIn:(id)a3 configuration:(id)a4 collectionViewPool:(id)a5 documentManager:(id)a6 actionManager:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  unint64_t v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  id v23;
  _QWORD v24[4];

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  v16 = objc_msgSend(v12, "copy");
  _bridgeAnyObjectToAny(_:)(v24, v16);
  swift_unknownObjectRelease(v16);
  v17 = sub_100086F94();
  swift_dynamicCast(&v23, v24, (char *)&type metadata for Any + 8, v17, 7);
  v18 = v23;
  objc_msgSend(v23, "setPresentingMakesCollectionFirstResponder:", 0);
  v19 = (void *)sub_100028490(v11, v18, v13, v14, v15);
  v20 = objc_allocWithZone((Class)type metadata accessor for DOCSearchController());
  v21 = (void *)sub_10045DF98(v18, v19);

  return v21;
}

- (void)deactivateAlongsideContainingTransitionCoordinator:(id)a3
{
  -[UISearchController setActive:](self, "setActive:", 0);
}

@end
