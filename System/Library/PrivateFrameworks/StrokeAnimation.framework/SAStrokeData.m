@implementation SAStrokeData

- (SAStrokeData)initWithCharacter:(id)a3 strokeAnimationRepresention:(id)a4 strokeNames:(id)a5 pronunciation:(id)a6
{
  SAStrokeData *v6;
  SAStrokeData *v8;
  SAStrokeDataInternal *v9;
  id v10;
  id v11;
  id v12;
  id v13;
  SAStrokeDataInternal *v14;
  SAStrokeData *v18;
  char v19;
  id v20;
  char v21;
  id v22;
  objc_super v23;
  id v24;
  id v25;
  id v26;
  id location[2];
  SAStrokeData *v28;
  id v29;
  _QWORD v30[2];

  v30[1] = *MEMORY[0x24BDAC8D0];
  v28 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v26 = 0;
  objc_storeStrong(&v26, a4);
  v25 = 0;
  objc_storeStrong(&v25, a5);
  v24 = 0;
  objc_storeStrong(&v24, a6);
  v6 = v28;
  v28 = 0;
  v23.receiver = v6;
  v23.super_class = (Class)SAStrokeData;
  v18 = -[SAStrokeData init](&v23, sel_init);
  v28 = v18;
  objc_storeStrong((id *)&v28, v18);
  if (v18)
  {
    v14 = [SAStrokeDataInternal alloc];
    v21 = 0;
    if (location[0])
    {
      v30[0] = location[0];
      v22 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v30, 1);
      v21 = 1;
      v13 = v22;
    }
    else
    {
      v13 = 0;
    }
    v11 = v26;
    v12 = v25;
    v19 = 0;
    if (v24)
    {
      v29 = v24;
      v20 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v29, 1);
      v19 = 1;
      v10 = v20;
    }
    else
    {
      v10 = 0;
    }
    v9 = -[SAStrokeDataInternal initWithCharacters:strokeAnimationRepresention:strokeNames:pronunciations:](v14, "initWithCharacters:strokeAnimationRepresention:strokeNames:pronunciations:", v13, v11, v12, v10);
    -[SAStrokeData setUnderlyingObject:](v28, "setUnderlyingObject:");

    if ((v19 & 1) != 0)
    if ((v21 & 1) != 0)

  }
  v8 = v28;
  objc_storeStrong(&v24, 0);
  objc_storeStrong(&v25, 0);
  objc_storeStrong(&v26, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v28, 0);
  return v8;
}

- (SAStrokeData)initWithCharacters:(id)a3 strokeAnimationRepresention:(id)a4 strokeNames:(id)a5 pronunciations:(id)a6
{
  SAStrokeData *v6;
  SAStrokeDataInternal *v7;
  SAStrokeData *v9;
  SAStrokeDataInternal *v10;
  SAStrokeData *v14;
  objc_super v15;
  id v16;
  id v17;
  id v18;
  id location[2];
  SAStrokeData *v20;

  v20 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v18 = 0;
  objc_storeStrong(&v18, a4);
  v17 = 0;
  objc_storeStrong(&v17, a5);
  v16 = 0;
  objc_storeStrong(&v16, a6);
  v6 = v20;
  v20 = 0;
  v15.receiver = v6;
  v15.super_class = (Class)SAStrokeData;
  v14 = -[SAStrokeData init](&v15, sel_init);
  v20 = v14;
  objc_storeStrong((id *)&v20, v14);
  if (v14)
  {
    v7 = [SAStrokeDataInternal alloc];
    v10 = -[SAStrokeDataInternal initWithCharacters:strokeAnimationRepresention:strokeNames:pronunciations:](v7, "initWithCharacters:strokeAnimationRepresention:strokeNames:pronunciations:", location[0], v18, v17, v16);
    -[SAStrokeData setUnderlyingObject:](v20, "setUnderlyingObject:");

  }
  v9 = v20;
  objc_storeStrong(&v16, 0);
  objc_storeStrong(&v17, 0);
  objc_storeStrong(&v18, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v20, 0);
  return v9;
}

- (SAStrokeDataInternal)underlyingObject
{
  return self->_underlyingObject;
}

- (void)setUnderlyingObject:(id)a3
{
  objc_storeStrong((id *)&self->_underlyingObject, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_underlyingObject, 0);
}

@end
