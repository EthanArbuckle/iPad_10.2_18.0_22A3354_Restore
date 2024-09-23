@implementation TransitSignViewState

- (BOOL)isEqual:(id)a3
{
  TransitSignViewState *v4;
  TransitSignViewState *v5;
  uint64_t v6;
  unsigned __int8 v7;
  TransitSignViewState *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;

  v4 = (TransitSignViewState *)a3;
  v5 = v4;
  if (self == v4)
  {
    v7 = 1;
  }
  else
  {
    v6 = objc_opt_class(v4);
    if (v6 == objc_opt_class(self))
    {
      v8 = v5;
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[TransitSignViewState imageSource](v8, "imageSource"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[TransitSignViewState imageSource](self, "imageSource"));
      if (objc_msgSend(v9, "isEqual:", v10))
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[TransitSignViewState majorAttributedString](v8, "majorAttributedString"));
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[TransitSignViewState majorAttributedString](self, "majorAttributedString"));
        if (objc_msgSend(v11, "isEqualToAttributedString:", v12))
        {
          v13 = (void *)objc_claimAutoreleasedReturnValue(-[TransitSignViewState minorAttributedString](v8, "minorAttributedString"));
          v14 = (void *)objc_claimAutoreleasedReturnValue(-[TransitSignViewState minorAttributedString](self, "minorAttributedString"));
          if (objc_msgSend(v13, "isEqualToAttributedString:", v14))
          {
            v15 = (void *)objc_claimAutoreleasedReturnValue(-[TransitSignViewState tertiaryAttributedString](v8, "tertiaryAttributedString"));
            v25 = (void *)objc_claimAutoreleasedReturnValue(-[TransitSignViewState tertiaryAttributedString](self, "tertiaryAttributedString"));
            v26 = v15;
            if (objc_msgSend(v15, "isEqualToAttributedString:", v25))
            {
              v16 = (void *)objc_claimAutoreleasedReturnValue(-[TransitSignViewState incidentAttributedString](v8, "incidentAttributedString"));
              v23 = (void *)objc_claimAutoreleasedReturnValue(-[TransitSignViewState incidentAttributedString](self, "incidentAttributedString"));
              v24 = v16;
              if (objc_msgSend(v16, "isEqualToAttributedString:", v23))
              {
                v17 = (void *)objc_claimAutoreleasedReturnValue(-[TransitSignViewState incidents](v8, "incidents"));
                v21 = (void *)objc_claimAutoreleasedReturnValue(-[TransitSignViewState incidents](self, "incidents"));
                v22 = v17;
                if (objc_msgSend(v17, "isEqualToArray:", v21))
                {
                  v20 = (void *)objc_claimAutoreleasedReturnValue(-[TransitSignViewState clusteredRouteOptionLabelItems](v8, "clusteredRouteOptionLabelItems"));
                  v18 = (void *)objc_claimAutoreleasedReturnValue(-[TransitSignViewState clusteredRouteOptionLabelItems](self, "clusteredRouteOptionLabelItems"));
                  v7 = objc_msgSend(v20, "isEqualToArray:");

                }
                else
                {
                  v7 = 0;
                }

              }
              else
              {
                v7 = 0;
              }

            }
            else
            {
              v7 = 0;
            }

          }
          else
          {
            v7 = 0;
          }

        }
        else
        {
          v7 = 0;
        }

      }
      else
      {
        v7 = 0;
      }

    }
    else
    {
      v7 = 0;
    }
  }

  return v7;
}

- (MKArtworkImageSource)imageSource
{
  return self->_imageSource;
}

- (void)setImageSource:(id)a3
{
  objc_storeStrong((id *)&self->_imageSource, a3);
}

- (NSAttributedString)majorAttributedString
{
  return self->_majorAttributedString;
}

- (void)setMajorAttributedString:(id)a3
{
  objc_storeStrong((id *)&self->_majorAttributedString, a3);
}

- (NSAttributedString)minorAttributedString
{
  return self->_minorAttributedString;
}

- (void)setMinorAttributedString:(id)a3
{
  objc_storeStrong((id *)&self->_minorAttributedString, a3);
}

- (NSAttributedString)tertiaryAttributedString
{
  return self->_tertiaryAttributedString;
}

- (void)setTertiaryAttributedString:(id)a3
{
  objc_storeStrong((id *)&self->_tertiaryAttributedString, a3);
}

- (NSAttributedString)incidentAttributedString
{
  return self->_incidentAttributedString;
}

- (void)setIncidentAttributedString:(id)a3
{
  objc_storeStrong((id *)&self->_incidentAttributedString, a3);
}

- (NSArray)incidents
{
  return self->_incidents;
}

- (void)setIncidents:(id)a3
{
  objc_storeStrong((id *)&self->_incidents, a3);
}

- (NSArray)clusteredRouteOptionLabelItems
{
  return self->_clusteredRouteOptionLabelItems;
}

- (void)setClusteredRouteOptionLabelItems:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clusteredRouteOptionLabelItems, 0);
  objc_storeStrong((id *)&self->_incidents, 0);
  objc_storeStrong((id *)&self->_incidentAttributedString, 0);
  objc_storeStrong((id *)&self->_tertiaryAttributedString, 0);
  objc_storeStrong((id *)&self->_minorAttributedString, 0);
  objc_storeStrong((id *)&self->_majorAttributedString, 0);
  objc_storeStrong((id *)&self->_imageSource, 0);
}

@end
