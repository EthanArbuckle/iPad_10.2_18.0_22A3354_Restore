@implementation Flyover

- (Flyover)initWithAnnouncement:(id)a3 mapItem:(id)a4 animationID:(unint64_t)a5
{
  id v9;
  id v10;
  Flyover *v11;
  Flyover *v12;
  uint64_t v13;
  GEOPDFlyover *flyover;
  Flyover *v15;
  objc_super v17;

  v9 = a3;
  v10 = a4;
  v17.receiver = self;
  v17.super_class = (Class)Flyover;
  v11 = -[Flyover init](&v17, "init");
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_mapItem, a4);
    objc_storeStrong((id *)&v12->_announcement, a3);
    v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "_flyover"));
    flyover = v12->_flyover;
    v12->_flyover = (GEOPDFlyover *)v13;

    v12->_animationID = a5;
    v15 = v12;
  }

  return v12;
}

- (NSString)announcement
{
  return self->_announcement;
}

- (GEOPDFlyover)flyover
{
  return self->_flyover;
}

- (unint64_t)animationID
{
  return self->_animationID;
}

- (MKMapItem)mapItem
{
  return self->_mapItem;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mapItem, 0);
  objc_storeStrong((id *)&self->_flyover, 0);
  objc_storeStrong((id *)&self->_announcement, 0);
}

@end
