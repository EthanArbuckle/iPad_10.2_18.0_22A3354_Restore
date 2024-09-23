@implementation PKSeat

+ (id)createFromDictionary:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  v4 = -[PKSeat _initFromDictionary:]([PKSeat alloc], "_initFromDictionary:", v3);

  return v4;
}

- (PKSeat)init
{

  return 0;
}

- (id)_initFromDictionary:(id)a3
{
  id v4;
  PKSeat *v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  void *v16;
  uint64_t v17;
  void *v18;
  id v19;
  void *v20;
  uint64_t v21;
  void *v22;
  id v23;
  void *v24;
  uint64_t v25;
  void *v26;
  id v27;
  void *v28;
  uint64_t v29;
  void *v30;
  id v31;
  void *v32;
  uint64_t v33;
  void *v34;
  id v35;
  void *v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  PKColor *sectionColor;
  unint64_t attributes;
  PKSeat *v42;
  NSObject *v43;
  void *v45;
  void *v46;
  uint8_t buf[16];
  objc_super v48;

  v4 = a3;
  v48.receiver = self;
  v48.super_class = (Class)PKSeat;
  v5 = -[PKSeat init](&v48, sel_init);
  if (!v5)
    goto LABEL_30;
  objc_msgSend(v4, "PKStringForKey:", CFSTR("seatNumber"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  v8 = v7;
  if (v7)
  {
    v9 = objc_msgSend(v7, "length");

    if (v9)
    {
      objc_storeStrong((id *)&v5->_designation, v6);
      v5->_attributes |= 1uLL;
    }
  }
  v46 = v8;
  objc_msgSend(v4, "PKStringForKey:", CFSTR("seatRow"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  v12 = v11;
  if (v11)
  {
    v13 = objc_msgSend(v11, "length");

    if (v13)
    {
      objc_storeStrong((id *)&v5->_row, v10);
      v5->_attributes |= 2uLL;
    }
  }
  objc_msgSend(v4, "PKStringForKey:", CFSTR("seatSection"), v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  v16 = v15;
  if (v15)
  {
    v17 = objc_msgSend(v15, "length");

    if (v17)
    {
      objc_storeStrong((id *)&v5->_section, v14);
      v5->_attributes |= 4uLL;
    }
  }
  objc_msgSend(v4, "PKStringForKey:", CFSTR("seatAisle"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v18;
  v20 = v19;
  if (v19)
  {
    v21 = objc_msgSend(v19, "length");

    if (v21)
    {
      objc_storeStrong((id *)&v5->_aisle, v18);
      v5->_attributes |= 8uLL;
    }
  }
  objc_msgSend(v4, "PKStringForKey:", CFSTR("seatLevel"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v22;
  v24 = v23;
  if (v23)
  {
    v25 = objc_msgSend(v23, "length");

    if (v25)
    {
      objc_storeStrong((id *)&v5->_level, v22);
      v5->_attributes |= 0x10uLL;
    }
  }
  objc_msgSend(v4, "PKStringForKey:", CFSTR("seatType"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = v26;
  v28 = v27;
  if (v27)
  {
    v29 = objc_msgSend(v27, "length");

    if (v29)
    {
      objc_storeStrong((id *)&v5->_type, v26);
      v5->_attributes |= 0x20uLL;
    }
  }
  objc_msgSend(v4, "PKStringForKey:", CFSTR("seatDescription"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = v30;
  v32 = v31;
  if (v31)
  {
    v33 = objc_msgSend(v31, "length");

    if (v33)
    {
      objc_storeStrong((id *)&v5->_seatDescription, v30);
      v5->_attributes |= 0x80uLL;
    }
  }
  objc_msgSend(v4, "PKStringForKey:", CFSTR("seatIdentifier"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = v34;
  v36 = v35;
  if (v35)
  {
    v37 = objc_msgSend(v35, "length");

    if (v37)
    {
      objc_storeStrong((id *)&v5->_identifier, v34);
      v5->_attributes |= 0x100uLL;
    }
  }
  objc_msgSend(v4, "PKStringForKey:", CFSTR("seatSectionColor"));
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v38)
  {
    attributes = v5->_attributes;

    if (attributes)
      goto LABEL_30;
LABEL_34:
    v42 = 0;
    goto LABEL_35;
  }
  +[PKColor colorFromString:](PKColor, "colorFromString:", v38);
  v39 = objc_claimAutoreleasedReturnValue();
  if (!v39)
  {
    PKLogFacilityTypeGetObject(0);
    v43 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18FC92000, v43, OS_LOG_TYPE_DEFAULT, "[PKSeatingInformation] Unable to parse sectionColor, ignoring", buf, 2u);
    }

    goto LABEL_34;
  }
  sectionColor = v5->_sectionColor;
  v5->_sectionColor = (PKColor *)v39;

  v5->_attributes |= 0x40uLL;
LABEL_30:
  v42 = v5;
LABEL_35:

  return v42;
}

- (BOOL)containsAttributes:(unint64_t)a3
{
  return (a3 & ~self->_attributes) == 0;
}

- (BOOL)intersectsAttributes:(unint64_t)a3
{
  return (self->_attributes & a3) != 0 || a3 == 0;
}

- (unint64_t)diffFromSeat:(id)a3
{
  NSString *designation;
  NSString *v5;
  _QWORD *v6;
  BOOL v7;
  int v9;
  unint64_t v10;
  NSString *row;
  NSString *v12;
  int v13;
  NSString *section;
  NSString *v15;
  int v16;
  NSString *aisle;
  NSString *v18;
  int v19;
  NSString *level;
  NSString *v21;
  int v22;
  NSString *type;
  NSString *v24;
  int v25;
  PKColor *sectionColor;
  PKColor *v27;
  _BOOL4 v28;
  NSString *seatDescription;
  NSString *v30;
  int v31;
  unint64_t v32;
  NSString *identifier;
  NSString *v34;
  int v35;

  if (!a3)
    return 511;
  designation = self->_designation;
  v5 = (NSString *)*((_QWORD *)a3 + 2);
  v6 = a3;
  if (designation)
    v7 = v5 == 0;
  else
    v7 = 1;
  if (v7)
    v9 = designation == v5;
  else
    v9 = -[NSString isEqual:](designation, "isEqual:", v5);
  v10 = v9 ^ 1u;
  row = self->_row;
  v12 = (NSString *)v6[3];
  if (row && v12)
    v13 = -[NSString isEqual:](row, "isEqual:");
  else
    v13 = row == v12;
  if (!v13)
    v10 |= 2uLL;
  section = self->_section;
  v15 = (NSString *)v6[4];
  if (section && v15)
    v16 = -[NSString isEqual:](section, "isEqual:");
  else
    v16 = section == v15;
  if (!v16)
    v10 |= 4uLL;
  aisle = self->_aisle;
  v18 = (NSString *)v6[5];
  if (aisle && v18)
    v19 = -[NSString isEqual:](aisle, "isEqual:");
  else
    v19 = aisle == v18;
  if (!v19)
    v10 |= 8uLL;
  level = self->_level;
  v21 = (NSString *)v6[6];
  if (level && v21)
    v22 = -[NSString isEqual:](level, "isEqual:");
  else
    v22 = level == v21;
  if (!v22)
    v10 |= 0x10uLL;
  type = self->_type;
  v24 = (NSString *)v6[7];
  if (type && v24)
    v25 = -[NSString isEqual:](type, "isEqual:");
  else
    v25 = type == v24;
  if (!v25)
    v10 |= 0x20uLL;
  sectionColor = self->_sectionColor;
  v27 = (PKColor *)v6[8];
  if (sectionColor && v27)
    v28 = -[PKColor isEqual:](sectionColor, "isEqual:");
  else
    v28 = sectionColor == v27;
  if (!v28)
    v10 |= 0x40uLL;
  seatDescription = self->_seatDescription;
  v30 = (NSString *)v6[9];
  if (seatDescription && v30)
    v31 = -[NSString isEqual:](seatDescription, "isEqual:");
  else
    v31 = seatDescription == v30;
  if (v31)
    v32 = v10;
  else
    v32 = v10 | 0x80;
  identifier = self->_identifier;
  v34 = (NSString *)v6[10];

  if (identifier && v34)
    v35 = -[NSString isEqual:](identifier, "isEqual:", v34);
  else
    v35 = identifier == v34;
  if (v35)
    return v32;
  else
    return v32 | 0x100;
}

- (BOOL)isEqual:(id)a3
{
  PKSeat *v4;
  BOOL v5;

  v4 = (PKSeat *)a3;
  if (v4 == self)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0 && -[PKSeat isEqualToSeat:](self, "isEqualToSeat:", v4);
  }

  return v5;
}

- (BOOL)isEqualToSeat:(id)a3
{
  _QWORD *v4;
  NSString *designation;
  NSString *v6;
  BOOL v7;
  char v8;
  NSString *row;
  NSString *v10;
  void *v11;
  NSString *v12;
  NSString *v13;
  NSString *v14;
  _BOOL4 v15;
  void *v16;
  NSString *v17;
  _BOOL4 v18;
  void *v19;
  NSString *v20;
  _BOOL4 v21;
  char v22;
  NSString *type;
  NSString *v25;
  PKColor *sectionColor;
  PKColor *v27;
  NSString *seatDescription;
  NSString *v29;
  NSString *identifier;
  NSString *v31;

  v4 = a3;
  designation = self->_designation;
  v6 = (NSString *)v4[2];
  if (designation)
    v7 = v6 == 0;
  else
    v7 = 1;
  if (v7)
  {
    if (designation != v6)
      goto LABEL_32;
  }
  else
  {
    v8 = -[NSString isEqual:](designation, "isEqual:");
    if ((v8 & 1) == 0)
      goto LABEL_32;
  }
  row = self->_row;
  v10 = (NSString *)v4[3];
  if (row && v10)
  {
    if ((-[NSString isEqual:](row, "isEqual:") & 1) == 0)
      goto LABEL_32;
  }
  else if (row != v10)
  {
    goto LABEL_32;
  }
  v11 = (void *)v4[4];
  v12 = self->_section;
  v13 = v11;
  if (v12 == v13)
  {

  }
  else
  {
    v14 = v13;
    if (!v12 || !v13)
      goto LABEL_31;
    v15 = -[NSString isEqualToString:](v12, "isEqualToString:", v13);

    if (!v15)
      goto LABEL_32;
  }
  v16 = (void *)v4[5];
  v12 = self->_aisle;
  v17 = v16;
  if (v12 == v17)
  {

  }
  else
  {
    v14 = v17;
    if (!v12 || !v17)
      goto LABEL_31;
    v18 = -[NSString isEqualToString:](v12, "isEqualToString:", v17);

    if (!v18)
      goto LABEL_32;
  }
  v19 = (void *)v4[6];
  v12 = self->_level;
  v20 = v19;
  if (v12 == v20)
  {

    goto LABEL_35;
  }
  v14 = v20;
  if (!v12 || !v20)
  {
LABEL_31:

    goto LABEL_32;
  }
  v21 = -[NSString isEqualToString:](v12, "isEqualToString:", v20);

  if (!v21)
    goto LABEL_32;
LABEL_35:
  type = self->_type;
  v25 = (NSString *)v4[7];
  if (type && v25)
  {
    if ((-[NSString isEqual:](type, "isEqual:") & 1) == 0)
      goto LABEL_32;
  }
  else if (type != v25)
  {
    goto LABEL_32;
  }
  sectionColor = self->_sectionColor;
  v27 = (PKColor *)v4[8];
  if (sectionColor && v27)
  {
    if (!-[PKColor isEqual:](sectionColor, "isEqual:"))
      goto LABEL_32;
  }
  else if (sectionColor != v27)
  {
    goto LABEL_32;
  }
  seatDescription = self->_seatDescription;
  v29 = (NSString *)v4[9];
  if (seatDescription && v29)
  {
    if ((-[NSString isEqual:](seatDescription, "isEqual:") & 1) != 0)
      goto LABEL_50;
LABEL_32:
    v22 = 0;
    goto LABEL_33;
  }
  if (seatDescription != v29)
    goto LABEL_32;
LABEL_50:
  identifier = self->_identifier;
  v31 = (NSString *)v4[10];
  if (identifier && v31)
    v22 = -[NSString isEqual:](identifier, "isEqual:");
  else
    v22 = identifier == v31;
LABEL_33:

  return v22;
}

- (NSString)designation
{
  return self->_designation;
}

- (NSString)row
{
  return self->_row;
}

- (NSString)section
{
  return self->_section;
}

- (NSString)aisle
{
  return self->_aisle;
}

- (NSString)level
{
  return self->_level;
}

- (NSString)type
{
  return self->_type;
}

- (PKColor)sectionColor
{
  return self->_sectionColor;
}

- (NSString)seatDescription
{
  return self->_seatDescription;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_seatDescription, 0);
  objc_storeStrong((id *)&self->_sectionColor, 0);
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_level, 0);
  objc_storeStrong((id *)&self->_aisle, 0);
  objc_storeStrong((id *)&self->_section, 0);
  objc_storeStrong((id *)&self->_row, 0);
  objc_storeStrong((id *)&self->_designation, 0);
}

@end
