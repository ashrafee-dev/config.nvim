package main

type notification interface {
	importance() int
}

type directMessage struct {
	senderUsername string
	messageContent string
	priorityLevel  int
	isUrgent       bool
}

type groupMessage struct {
	groupName      string
	messageContent string
	priorityLevel  int
}

type systemAlert struct {
	alertCode      string
	messageContent string
}

func (p directMessage) importance() int {
	if p.isUrgent {
		return 50
	}
	return p.priorityLevel
}
func (p groupMessage) importance() int {
	return p.priorityLevel
}
func (p systemAlert) importance() int {
	return 100
}

func processNotification(n notification) (string, int) {
	switch v := n.(type) {
	case directMessage:
		return v.senderUsername, n.importance()

	}

}
