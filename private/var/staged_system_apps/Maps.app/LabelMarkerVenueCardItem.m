@implementation LabelMarkerVenueCardItem

- (LabelMarkerVenueCardItem)init
{

  return 0;
}

- (LabelMarkerVenueCardItem)initWithLabelMarker:(id)a3
{
  id v5;
  LabelMarkerVenueCardItem *v6;
  LabelMarkerVenueCardItem *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)LabelMarkerVenueCardItem;
  v6 = -[LabelMarkerVenueCardItem init](&v9, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_labelMarker, a3);

  return v7;
}

- (VKLabelMarker)venueLabelMarker
{
  return self->_labelMarker;
}

- (BOOL)isVenueItem
{
  return -[LabelMarkerVenueCardItem venueID](self, "venueID") != 0;
}

- (unint64_t)venueID
{
  void *v3;
  unint64_t v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;

  if ((-[VKLabelMarker isCluster](self->_labelMarker, "isCluster") & 1) == 0)
    return (unint64_t)-[VKLabelMarker venueID](self->_labelMarker, "venueID");
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 1;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[VKLabelMarker clusterFeatureAnnotations](self->_labelMarker, "clusterFeatureAnnotations"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100313ACC;
  v6[3] = &unk_1011B16B8;
  v6[4] = &v11;
  v6[5] = &v7;
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", v6);

  if (*((_BYTE *)v8 + 24))
    v4 = v12[3];
  else
    v4 = 0;
  _Block_object_dispose(&v7, 8);
  _Block_object_dispose(&v11, 8);
  return v4;
}

- (unint64_t)venueCardID
{
  return (unint64_t)-[VKLabelMarker businessID](self->_labelMarker, "businessID");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_labelMarker, 0);
}

@end
