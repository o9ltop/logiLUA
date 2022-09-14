function OnEvent(event, arg)
  if (event == "MOUSE_BUTTON_PRESSED" and arg == 5) then-- G1 has been pressedend
    buildMerge(5)
  end
  if (event == "MOUSE_BUTTON_PRESSED" and arg == 4) then
    PRK("3")
    buildBlink(3,0,5,1)
  end
end 

function buildMerge(num)
  PRK("right")
  moveMouseAndpress(3,0,num)
  
  PRK("2")
  PRK("right")
  
  MMR(-1,1)
  moveMouseAndpress(3,0,num)
  
  MMR(0,-2)
  moveMouseAndpress(3,0,num)
  
  MMR(3,-3)
  moveMouseAndpress(3,0,num)
  
  PRK("3")
  MMR(-1,3)
  buildBlink(3,0,num,1)
  
  MMR(0,-2)
  buildBlink(3,0,num,0)
  
  PRK("1")
  buildRoads(0,-1,3,0,num)
  
  MMR(0,3)
  buildRoads(0,-1,3,0,num)
  
  MMR(-3,1)
  buildRoads(num*3-3,0,0,0,1)
  
  MMR(0,-3)
  buildRoads(num*3-3,0,0,0,1)
  
  MMR(5,-3)
  buildRoads(num*3-3,0,0,0,1)
end

function buildColor(num)
  --画染色器
  PRK("9")
  PRK("left")
  moveMouseAndpress(2,0,num)
  
  --画染色器下方交换器
  PRK("2")
  PRK("2")--操作被吞原因未知
  PRK("right")
  
  MMR(-1,-1)
  moveMouseAndpress(2,0,num)
  
 
  MMR(-1,5)
  moveMouseAndpress(2,0,num)
  
 
  MMR(3,3)
  moveMouseAndpress(2,0,num)

  --画传送门
  
  PRK("3")
  MMR(-1,-5)
  buildBlink(2,0,num,0)
  
 
  MMR(0,3)
  buildBlink(2,0,num,1)
 
  --画传从带 
  PRK("1")
  MMR(0,-6)
  buildRoads(0,1,2,0,num)
  
  MMR(0,6)
  buildRoads(0,1,2,0,num)
  
  MMR(1,2)
  buildRoads(num*2-1,0,0,0,1)
  
  MMR(-4,-3)
  buildRoads(num*2-1,0,0,0,1)
  
  MMR(2,-1)
  buildRoads(0,-2,2,0,num)
  
  MMR(-2,-5)
  buildRoads(num*2,0,0,0,1)
end 

function buildRoad(x,y)
  PK("lshift")
  PMB(1)
  MMR(x,y)
  RMB(1)
  RK("lshift")
  MMR(-x,-y)
end 

function buildRoads(x,y,batchx,batchy,num)
  for i=1,num,1 do
    buildRoad(x,y)
    MMR(batchx,batchy)
  end
  MMR(-batchx*num,-batchy*num)
end

function moveMouseAndpress(x,y,num)
    num=num-1
    for i=1,num,1 do
        PRMB(1)
        MMR(x,y)
    end 
    PRMB(1)
    MMR(-x*num,-y*num)
end

function buildBlink(x,y,num,dir)
  num=num-1
  for i=1,num,1 do
    if (dir ==0)then
      PRK("up")
    else
      PRK("down")
    end
    PRMB(1)
    MMR(x,y)
  end 
  if (dir ==0)then
      PRK("up")
    else
      PRK("down")
    end
  PRMB(1)
  MMR(-x*num,-y*num)
end

function MMR(rx,ry)
  Sleep(1)
  x,y = GetMousePosition()
  Sleep(1)
  MoveMouseTo(x+rx*1074,y-ry*1900)
end


function PRK(key)
  Sleep(1)
  PressAndReleaseKey(key)
end

function PK(key)
  Sleep(1)
  PressKey(key)
end

function RK(key)
  Sleep(1)
  ReleaseKey(key)
end

function PRMB(key)
  Sleep(1)
  PressAndReleaseMouseButton(key)
end

function PMB(key)
  Sleep(1)
  PressMouseButton(key)
end

function RMB(key)
  Sleep(1)
  ReleaseMouseButton(key)
end