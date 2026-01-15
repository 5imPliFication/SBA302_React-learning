import { Container, Row, Col, Card, Button } from "react-bootstrap";
import { OrchidsData } from "./ListOfOrchids";
import React from "react";
import { Modal } from "react-bootstrap";

const Orchids = () => {

    const [show, setShow] = React.useState(false);
    const [selectedOrchid, setSelectedOrchid] = React.useState(null);
    const handleClose = () => setShow(false);
    const handleShow = (orchid) => {
      setSelectedOrchid(orchid);
      setShow(true);
    };

  return (
    <Container>
      <Row>
        {OrchidsData.map((orchid) => (
          <Col md={3} key={orchid.id} className="mt-4">
            <Card>
              <Card.Img
                variant="top"
                src={orchid.image}
                alt={`${orchid.orchidName} picture`}
              />
              <Card.Body>
                <Card.Title>{orchid.orchidName}</Card.Title>
                <Card.Text>{orchid.category}</Card.Text>
                <Button variant="primary" onClick={() => handleShow(orchid)}>
                  Detail
                </Button>
              </Card.Body>
            </Card>
          </Col>
        ))}
      </Row>
      <Modal show={show} onHide={handleClose} >
        <Modal.Header closeButton>
          <Modal.Title>
            {selectedOrchid ? selectedOrchid.orchidName : ""}
          </Modal.Title>
        </Modal.Header>
        <Modal.Body >
          {selectedOrchid ? (
            <div>
              <img
                src={selectedOrchid.image}
                alt={selectedOrchid.orchidName}
                style={{ width: "100%" }}
                className="mb-3"
              />
              <p>{selectedOrchid.description}</p>
            </div>
          ) : (
            <p>Loading details...</p>
          )}
        </Modal.Body>
        <Modal.Footer>
          <Button variant="secondary" onClick={handleClose}>
            Close
          </Button>
        </Modal.Footer>
      </Modal>
    </Container>
  );
};
export default Orchids;
