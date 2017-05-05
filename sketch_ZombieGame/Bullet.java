import processing.core.*;
import java.awt.Color;

public class Bullet extends Person {

  public Bullet(PApplet app, Survivor s) {
    super(app);
    setColor( Color.WHITE);
    setXPos( s.checkXPos() );
    setYPos( s.checkYPos() );
    setXSpeed( 8 );
    double theta = Math.atan2(getApp().mouseY - s.getYPos(), getApp().mouseX - s.getXPos());
    setXSpeed( (int)(8 * Math.cos(theta)) );
    setYSpeed( (int)(8 * Math.sin(theta)) );
    getApp().println(theta);
  }

  public void draw() {
    getApp().fill(getColor().getRGB());
    getApp().ellipse(getXPos(), getYPos(), getSize(), getSize());
  }
}