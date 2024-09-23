@implementation OADTableStyle

- (void)setId:(id)a3
{
  objc_storeStrong((id *)&self->mId, a3);
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->mName, a3);
}

- (void)setWholeTableStyle:(id)a3
{
  objc_storeStrong((id *)&self->mWholeTableStyle, a3);
}

- (void)setBand1HorzStyle:(id)a3
{
  objc_storeStrong((id *)&self->mBand1HorzStyle, a3);
}

- (void)setBand2HorzStyle:(id)a3
{
  objc_storeStrong((id *)&self->mBand2HorzStyle, a3);
}

- (void)setBand1VertStyle:(id)a3
{
  objc_storeStrong((id *)&self->mBand1VertStyle, a3);
}

- (void)setBand2VertStyle:(id)a3
{
  objc_storeStrong((id *)&self->mBand2VertStyle, a3);
}

- (void)setLastColumnStyle:(id)a3
{
  objc_storeStrong((id *)&self->mLastColumnStyle, a3);
}

- (void)setFirstColumnStyle:(id)a3
{
  objc_storeStrong((id *)&self->mFirstColumnStyle, a3);
}

- (void)setLastRowStyle:(id)a3
{
  objc_storeStrong((id *)&self->mLastRowStyle, a3);
}

- (void)setFirstRowStyle:(id)a3
{
  objc_storeStrong((id *)&self->mFirstRowStyle, a3);
}

- (id)id
{
  return self->mId;
}

- (id)background
{
  return self->mBackground;
}

- (id)firstRowStyle
{
  return self->mFirstRowStyle;
}

- (id)wholeTableStyle
{
  return self->mWholeTableStyle;
}

- (id)band1HorzStyle
{
  return self->mBand1HorzStyle;
}

- (void)setSouthEastStyle:(id)a3
{
  objc_storeStrong((id *)&self->mSouthEastStyle, a3);
}

- (void)setSouthWestStyle:(id)a3
{
  objc_storeStrong((id *)&self->mSouthWestStyle, a3);
}

- (void)setNorthEastStyle:(id)a3
{
  objc_storeStrong((id *)&self->mNorthEastStyle, a3);
}

- (void)setNorthWestStyle:(id)a3
{
  objc_storeStrong((id *)&self->mNorthWestStyle, a3);
}

- (void)setBackground:(id)a3
{
  objc_storeStrong((id *)&self->mBackground, a3);
}

- (id)name
{
  return self->mName;
}

- (id)partStyle:(int)a3
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  switch(a3)
  {
    case 1:
      -[OADTableStyle wholeTableStyle](self, "wholeTableStyle", v3, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 2:
      -[OADTableStyle band1HorzStyle](self, "band1HorzStyle", v3, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 3:
      -[OADTableStyle band2HorzStyle](self, "band2HorzStyle", v3, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 4:
      -[OADTableStyle band1VertStyle](self, "band1VertStyle", v3, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 5:
      -[OADTableStyle band2VertStyle](self, "band2VertStyle", v3, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 6:
      -[OADTableStyle firstRowStyle](self, "firstRowStyle", v3, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 7:
      -[OADTableStyle lastRowStyle](self, "lastRowStyle", v3, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 8:
      -[OADTableStyle firstColumnStyle](self, "firstColumnStyle", v3, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 9:
      -[OADTableStyle lastColumnStyle](self, "lastColumnStyle", v3, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 10:
      -[OADTableStyle northWestStyle](self, "northWestStyle", v3, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 11:
      -[OADTableStyle northEastStyle](self, "northEastStyle", v3, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 12:
      -[OADTableStyle southWestStyle](self, "southWestStyle", v3, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 13:
      -[OADTableStyle southEastStyle](self, "southEastStyle", v3, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      v5 = 0;
      break;
  }
  return v5;
}

- (void)setStyle:(id)a3 forPart:(int)a4
{
  id v6;

  v6 = a3;
  switch(a4)
  {
    case 1:
      -[OADTableStyle setWholeTableStyle:](self, "setWholeTableStyle:", v6);
      break;
    case 2:
      -[OADTableStyle setBand1HorzStyle:](self, "setBand1HorzStyle:", v6);
      break;
    case 3:
      -[OADTableStyle setBand2HorzStyle:](self, "setBand2HorzStyle:", v6);
      break;
    case 4:
      -[OADTableStyle setBand1VertStyle:](self, "setBand1VertStyle:", v6);
      break;
    case 5:
      -[OADTableStyle setBand2VertStyle:](self, "setBand2VertStyle:", v6);
      break;
    case 6:
      -[OADTableStyle setFirstRowStyle:](self, "setFirstRowStyle:", v6);
      break;
    case 7:
      -[OADTableStyle setLastRowStyle:](self, "setLastRowStyle:", v6);
      break;
    case 8:
      -[OADTableStyle setFirstColumnStyle:](self, "setFirstColumnStyle:", v6);
      break;
    case 9:
      -[OADTableStyle setLastColumnStyle:](self, "setLastColumnStyle:", v6);
      break;
    case 10:
      -[OADTableStyle setNorthWestStyle:](self, "setNorthWestStyle:", v6);
      break;
    case 11:
      -[OADTableStyle setNorthEastStyle:](self, "setNorthEastStyle:", v6);
      break;
    case 12:
      -[OADTableStyle setSouthWestStyle:](self, "setSouthWestStyle:", v6);
      break;
    case 13:
      -[OADTableStyle setSouthEastStyle:](self, "setSouthEastStyle:", v6);
      break;
    default:
      break;
  }

}

- (id)band2HorzStyle
{
  return self->mBand2HorzStyle;
}

- (id)band1VertStyle
{
  return self->mBand1VertStyle;
}

- (id)band2VertStyle
{
  return self->mBand2VertStyle;
}

- (id)firstColumnStyle
{
  return self->mFirstColumnStyle;
}

- (id)lastRowStyle
{
  return self->mLastRowStyle;
}

- (id)lastColumnStyle
{
  return self->mLastColumnStyle;
}

- (id)northEastStyle
{
  return self->mNorthEastStyle;
}

- (id)northWestStyle
{
  return self->mNorthWestStyle;
}

- (id)southEastStyle
{
  return self->mSouthEastStyle;
}

- (id)southWestStyle
{
  return self->mSouthWestStyle;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)OADTableStyle;
  -[OADTableStyle description](&v3, sel_description);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mSouthWestStyle, 0);
  objc_storeStrong((id *)&self->mSouthEastStyle, 0);
  objc_storeStrong((id *)&self->mNorthWestStyle, 0);
  objc_storeStrong((id *)&self->mNorthEastStyle, 0);
  objc_storeStrong((id *)&self->mLastColumnStyle, 0);
  objc_storeStrong((id *)&self->mLastRowStyle, 0);
  objc_storeStrong((id *)&self->mFirstColumnStyle, 0);
  objc_storeStrong((id *)&self->mFirstRowStyle, 0);
  objc_storeStrong((id *)&self->mBand2VertStyle, 0);
  objc_storeStrong((id *)&self->mBand1VertStyle, 0);
  objc_storeStrong((id *)&self->mBand2HorzStyle, 0);
  objc_storeStrong((id *)&self->mBand1HorzStyle, 0);
  objc_storeStrong((id *)&self->mWholeTableStyle, 0);
  objc_storeStrong((id *)&self->mBackground, 0);
  objc_storeStrong((id *)&self->mId, 0);
  objc_storeStrong((id *)&self->mName, 0);
}

@end
